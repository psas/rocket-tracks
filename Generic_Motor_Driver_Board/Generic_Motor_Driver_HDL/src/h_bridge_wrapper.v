module h_bridge_wrapper(clk, enable, watchdog_in, clk_select, sw1_p, sw1_n, sw2_p, sw2_n, sw3_p, sw3_n,
						sample_clk, watchdog, E13, F14, G14, D14, E14, N16, P15, F13, R16, P16, N15, G13);

input clk, enable, watchdog_in, clk_select;
output sw1_p, sw1_n, sw2_p, sw2_n, sw3_p, sw3_n, P16;

output reg sample_clk, watchdog;
output reg D14, E13, F14, G14, E14, N16, P15, F13, R16, N15, G13;
reg sw1, sw2, sw3;
reg [31:0] counter;
reg [3:0] counter2;
reg [19:0] counter3;

assign P16 = 1;

	h_bridge h1(.clk(sample_clk),
				.enable(enable),
				.watchdog(watchdog),
				.sw1_input(sw1),
				.sw2_input(sw2),
				.sw3_input(sw3),
				.sw1_p(sw1_p),
				.sw1_n(sw1_n),
				.sw2_p(sw2_p),
				.sw2_n(sw2_n),
				.sw3_p(sw3_p),
				.sw3_n(sw3_n)
				);
	
	always @ (posedge clk) //Steps 50MHz clk down
	begin
		if (clk_select == 0 && counter < 25000)
			counter <= counter + 1; //1000Hz option
						
		else if (clk_select == 0 && counter >= 25000)
		begin
			sample_clk <= ~sample_clk;
			counter <= 1;
		end
		else if (clk_select == 1 && counter < 12500000)
			counter <= counter + 1; //2Hz option
						
		else if (clk_select == 1 && counter >= 12500000)
		begin
			sample_clk <= ~sample_clk;
			counter <= 1;
		end
	end
	always @ (posedge clk) watchdog <= watchdog_in;
			
	always @ (posedge sample_clk)
	begin
		if (counter2 < 15)
			counter2 <= counter2 + 1;
				
		else if (counter2 >= 15)
		begin
			sw1 <= ~sw1;
			counter2 <= 0;
		end
	end
	always @ (posedge sample_clk)
	begin
		if ((counter2 == 3) || (counter2 == 8))
			sw2 <= ~sw2;
	end
	always @ (posedge sample_clk)
		begin
			if ((counter2 == 13) || (counter2 == 5))
				sw3 <= ~sw3;
		end
	always @ (posedge clk) //7-segment displays
	begin
		if (counter3 >= 20'h00000 && counter3 < 20'h4FFFF) //Displays 1 when sw1 is high
		begin
			E13 <= ~sw1;
			F14 <= 1;
			G14 <= 1;
			D14 <= 1;
			
			E14 <= 1;
			N16 <= 1;
			P15 <= 1;
			F13 <= 1;
			R16 <= 1;
			N15 <= ~sw1;
			G13 <= ~sw1;
		end
		else if (counter3 >= 20'h4FFFF && counter3 < 20'h8FFFF) //Displays 2 when sw2 is high
		begin
			E13 <= 1;
			F14 <= ~sw2;
			G14 <= 1;
			D14 <= 1;
			
			E14 <= ~sw2;
			N16 <= ~sw2;
			P15 <= ~sw2;
			F13 <= 1;
			R16 <= ~sw2;
			N15 <= 1;
			G13 <= ~sw2;
		end
		else if (counter3 >= 20'h8FFFF && counter3 < 20'hCFFFF) //Displays 3 when sw3 is high
		begin
			E13 <= 1;
			F14 <= 1;
			G14 <= ~sw3;
			D14 <= 1;
			
			E14 <= ~sw3;
			N16 <= ~sw3;
			P15 <= ~sw3;
			F13 <= 1;
			R16 <= 1;
			N15 <= ~sw3;
			G13 <= ~sw3;
		end
		else if (counter3 >= 20'hCFFFF && counter3 <= 20'hFFFFF) //Displays E when enable is high
		begin
			E13 <= 1;
			F14 <= 1;
			G14 <= 1;
			D14 <= ~enable;
			
			E14 <= ~enable;
			N16 <= ~enable;
			P15 <= ~enable;
			F13 <= ~enable;
			R16 <= ~enable;
			N15 <= 1;
			G13 <= 1;
		end
	end
	always @ (posedge clk)  //sweep timer for 7-segment displays
		counter3 <= counter3 + 1;
endmodule
