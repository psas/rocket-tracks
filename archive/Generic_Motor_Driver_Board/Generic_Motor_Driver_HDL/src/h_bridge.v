// Filename        : h_bridge.v
// Description     : Operates H-Bridge FET drivers.
// Author          : Rob Gaskell, Jr. 8/6/2011
// Copyright 2011 Rob Gaskell, Jr. All rights reserved.

//All inputs are designed to be asserted low. For the opto-isolated board,
//this requires asserted-high GFE outputs which are inverted by the optos.

//reset disables outputs when low and therefore the input on the board is high.

module h_bridge (clk, 		//40MHz clock
				 reset, 	//disables outputs when low
				 watchdog,	//must switch at least every 2^20 clk cycles
				 status,	//LED
				
				 sw1_input,	//switch1 input low
				 sw1_p,
				 sw1_n,
				 sw2_input, //switch2 input low
				 sw2_p, 	
				 sw2_n,
				 sw3_input,	//switch3 input low
				 sw3_p,
				 sw3_n
				);

//0.5Hz slow- normal
//4Hz fast- watchdog timeout or reset low

input clk, reset, watchdog, sw1_input, 
							sw2_input, 
							sw3_input;
output reg status;

output sw1_p, sw1_n, 
	   sw2_p, sw2_n, 
	   sw3_p, sw3_n;
	   
reg [19:0] watch_cnt;
reg watch_reset;
reg output_reset_watchdog;
reg [26:0] status_flash_cnt;

	always @ (posedge clk) 
	//watchdog counter resets at every change in watchdog input state
		begin
			if (reset == 1 && watch_reset != watchdog) 
			//resets at change in watchdog input
				begin
					watch_cnt <= 1;
					output_reset_watchdog <= 1;
					watch_reset <= watchdog;
				end
			
			else if (reset == 1 && watch_reset == watchdog && watch_cnt > 0) 
			//runs watchdog counter
				begin
					watch_cnt <= watch_cnt + 1;
					output_reset_watchdog <= 1;
				end
			
			else if (reset == 1 && watch_reset == watchdog && watch_cnt == 0) 
			//disables outputs if watchdog counter rolls over to zero
				begin
					watch_cnt <= 0;
					output_reset_watchdog <= 0;
				end
			
			else 									
			//resets watchdog when reset is low
				begin
					watch_cnt <= 1;
					output_reset_watchdog <= 1;
					watch_reset <= ~watchdog;
				end
		end
		
	always @ (posedge clk)
		begin
			if(output_reset_watchdog && reset) 
			//0.5Hz LED "status good" flash timer
				begin
					if(status_flash_cnt < 80000000) ++status_flash_cnt;
					else 
						begin
							status <= ~status;
							status_flash_cnt <= 0;
						end
				end
			else								
			//4Hz LED "bad status" flash timer
				begin
					if(status_flash_cnt < 10000000) ++status_flash_cnt;
					else
						begin
							status <= ~status;
							status_flash_cnt <= 0;
						end
				end
		end
					
	
	switch	switch1 (.clk(clk),
					 .reset(reset),
					 .sw_in(sw1_input),  
					 .gate_drive_p(sw1_p),  
					 .gate_drive_n(sw1_n),
					 .output_reset_watchdog(output_reset_watchdog)
					);
					   
	switch  switch2 (.clk(clk),
					 .reset(reset),
					 .sw_in(sw2_input), 
					 .gate_drive_p(sw2_p), 
					 .gate_drive_n(sw2_n),
					 .output_reset_watchdog(output_reset_watchdog)
					);
					   
	switch 	switch3 (.clk(clk),
					 .reset(reset),
					 .sw_in(sw3_input), 
					 .gate_drive_p(sw3_p), 
					 .gate_drive_n(sw3_n),
					 .output_reset_watchdog(output_reset_watchdog)
					);
	
endmodule

module switch  	(clk, 					//40MHz clock
				 reset,					//disables outputs when low
				 sw_in,					//switch1 input low
				 gate_drive_p,
				 gate_drive_n,
				 output_reset_watchdog
			    );

input clk,
	  reset,
	  sw_in,
	  output_reset_watchdog;
	  
output gate_drive_p, gate_drive_n;
reg out_p, out_n;

reg [2:0] count;

//asynchronous output reset/disable
assign gate_drive_p = (reset == 1) ? out_p : 0;	
assign gate_drive_n = (reset == 1) ? out_n : 0;

	always @ (posedge clk)
		begin
			
			if (reset == 1 && output_reset_watchdog && 
				out_p == sw_in && out_p != out_n)
			//turns off both outputs on change in input state
				begin
					out_p <= 0;
					out_n <= 0;
					count <= 0;
				end
					
			else if (reset == 1 && output_reset_watchdog &&	
					 out_p == out_n && count < 4) 
			//runs clock-cycle counter after change in input state
					 count <= count + 1;
				
			else if (reset == 1 && output_reset_watchdog &&	
					 out_p == out_n && sw_in == 1 && count == 4)
			//resets out_n at end of clock-cycle counter if sw_in = 1
				begin
					count <= 0;
					out_p <= 0;
					out_n <= 1;
				end
			
			else if (reset == 1 && output_reset_watchdog &&	
					 out_p == out_n && sw_in == 0 && count == 4)
			//resets out_p at end of clock-cycle counter if sw_in = 0
				begin
					count <= 0;
					out_n <= 0;
					out_p <= 1;
				end
				
			else if (reset == 1 && output_reset_watchdog &&	
					 out_p != sw_in && out_p != out_n)
			//holds clock-cycle counter at 0 if no change in sw_in
					 count <= 0;
			
			else
			//disbles outputs when reset is low
				begin
					count <= 0;
					out_n <= 0;
					out_p <= 0;
				end
		end
endmodule
