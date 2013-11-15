// Filename        : h_bridge.v
// Description     : Operates H-Bridge FET drivers.
// Author          : Rob Gaskell, Jr. 8/6/2011
// Copyright 2011 Rob Gaskell, Jr. All rights reserved.

//All inputs are designed to be asserted low. For the opto-isolated board,
//this requires asserted-high GFE outputs which are inverted by the optos.

//reset_n disables outputs when low and therefore the input to the board is high.


//****************************************************************************
//  module h_bridge
//  Description:
//  
//****************************************************************************
module h_bridge (clk, 			//40MHz clock
				 reset_n, 		//disables outputs when low
				 watchdog_in,	//must switch at least every 2^20 clk cycles
				 status,		//LED
				
				 sw1_input,		//switch1 input low
				 sw1_output_H,
				 sw1_output_L,
				 sw2_input, 	//switch2 input low
				 sw2_output_H, 	
				 sw2_output_L,
				 sw3_input,		//switch3 input low
				 sw3_output_H,
				 sw3_output_L
				);

//0.5Hz slow- normal
//4Hz fast- watchdog timeout or reset_n low

input clk, reset_n, watchdog_in, sw1_input, 
							sw2_input, 
							sw3_input;
output reg status;

output sw1_output_H, sw1_output_L, 
	   sw2_output_H, sw2_output_L, 
	   sw3_output_H, sw3_output_L;
	   
reg [19:0] watch_cnt;
reg prev_watchdog_in;
reg output_reset_watchdog;
reg [25:0] status_flash_cnt;
reg [4:0] LFSR_counter;

	always @ (posedge clk) 
	//watchdog counter resets at every change in watchdog input state
	begin
		if (reset_n == 1 && prev_watchdog_in != watchdog_in) 
		//change occurred in watchdog input
		begin
			watch_cnt <= 1;
			output_reset_watchdog <= 1;
			prev_watchdog_in <= watchdog_in;
		end
		else if (reset_n == 1 && prev_watchdog_in == watchdog_in && watch_cnt > 0) 
		//no change in watchdog, so increment counter counter
		begin
			watch_cnt <= watch_cnt + 1;
			output_reset_watchdog <= 1;
		end
		else if (reset_n == 1 && prev_watchdog_in == watchdog_in && watch_cnt == 0) 
		//watchdog counter rolled over to zero: disables outputs
		begin
			watch_cnt <= 0;
			output_reset_watchdog <= 0;
		end
		else 									
		//resets watchdog when reset_n is low
		begin
			watch_cnt <= 1;
			output_reset_watchdog <= 1;
			prev_watchdog_in <= ~watchdog_in;
		end
	end

	always @ (posedge clk)
	begin
		if(output_reset_watchdog && ~reset_n)
		//0.5Hz LED "status good" flash timer
			for(integer i = 0; i < 26; i = i + 1)
				status_flash_cnt[i] <= 1;
		else								
		//4Hz LED "bad status" flash timer
			for(integer i = 25; i > 0; i = i - 1)
				status_flash_cnt[i] <= status_flash_cnt[i-1];
		status_flash_cnt[0] <= ((status_flash_cnt[26] xor status_flash_cnt[6])  xor 
								(status_flash_cnt[2]  xor status_flash_cnt[1]));
	end
		
	always @ (posedge clk)
	begin
		if(output_reset_watchdog && ~reset_n)
		//0.5Hz LED "status good" flash timer
			if(status_flash_cnt > 40000000)
			begin
				status <= ~status;
				for(integer i = 0; i < 26; i = i + 1)
					status_flash_cnt[i] <= 1;
			end
		else if(status_flash_cnt > 5000000)
		end
	
	switch	switch1 (.clk(clk),
					 .reset_n(reset_n),
					 .sw_in(sw1_input),  
					 .gate_drive_H(sw1_output_H),  
					 .gate_drive_L(sw1_output_L),
					 .output_reset_watchdog(output_reset_watchdog)
					);
					   
	switch  switch2 (.clk(clk),
					 .reset_n(reset_n),
					 .sw_in(sw2_input), 
					 .gate_drive_H(sw2_output_H), 
					 .gate_drive_L(sw2_output_L),
					 .output_reset_watchdog(output_reset_watchdog)
					);
					   
	switch 	switch3 (.clk(clk),
					 .reset_n(reset_n),
					 .sw_in(sw3_input), 
					 .gate_drive_H(sw3_output_H), 
					 .gate_drive_L(sw3_output_L),
					 .output_reset_watchdog(output_reset_watchdog)
					);
endmodule // h_bridge


//****************************************************************************
//  module switch
//  Description:
//  
//****************************************************************************
module switch  	(clk, 					//40MHz clock
				 reset_n,				//disables outputs when low
				 sw_in,					//switch1 input low
				 gate_drive_H,
				 gate_drive_L,
				 output_reset_watchdog
			    );

input clk,
	  reset_n,
	  sw_in,
	  output_reset_watchdog;
	  
output gate_drive_H, gate_drive_L;
reg out_p, out_n;

reg [1:0] count;

//asynchronous output reset_n/disable
assign gate_drive_H = (reset_n == 1) ? out_p : 0;	
assign gate_drive_L = (reset_n == 1) ? out_n : 0;

	always @ (posedge clk)
	begin
		if (reset_n == 1 && output_reset_watchdog && 
			out_p == sw_in && out_p != out_n)
		//turns off both outputs on change in input state
		begin
			out_p <= 0;
			out_n <= 0;
			count <= 0;
		end
		else if (reset_n == 1 && output_reset_watchdog &&	
				 out_p == out_n && count < 4) 
		//runs clock-cycle counter after change in input state
				 count <= count + 1;
			
		else if (reset_n == 1 && output_reset_watchdog &&	
				 out_p == out_n && sw_in == 1 && count == 4)
		//resets out_n at end of clock-cycle counter if sw_in = 1
		begin
			count <= 0;
			out_p <= 0;
			out_n <= 1;
		end
		else if (reset_n == 1 && output_reset_watchdog &&	
				 out_p == out_n && sw_in == 0 && count == 4)
		//resets out_p at end of clock-cycle counter if sw_in = 0
		begin
			count <= 0;
			out_n <= 0;
			out_p <= 1;
		end
		else if (reset_n == 1 && output_reset_watchdog &&	
				 out_p != sw_in && out_p != out_n)
		//holds clock-cycle counter at 0 if no change in sw_in
			count <= 0;
		else
		//disbles outputs when reset_n is low
		begin
			count <= 0;
			out_n <= 0;
			out_p <= 0;
		end
	end
endmodule // switch
