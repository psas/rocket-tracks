module TESTh_bridge();

reg clk, enable, watchdog, sw1_input, sw2_input, sw3_input;
wire sw1_p, sw1_n, sw2_p, sw2_n, sw3_p, sw3_n;

integer i, j;
integer k = 100;

	h_bridge h1 (.clk(clk),
				 .enable(enable),
				 .watchdog(watchdog),
			     .sw1_input(sw1_input),
				 .sw1_p(sw1_p),
				 .sw1_n(sw1_n),
				 .sw2_input(sw2_input),
				 .sw2_p(sw2_p),
				 .sw2_n(sw2_n),
				 .sw3_input(sw3_input),
				 .sw3_p(sw3_p),
				 .sw3_n(sw3_n)
			    );
	
	initial @ (j) //Assigns initial values and runs clk
		begin
			
			sw1_input = 0;
			sw2_input = 1;
			sw3_input = 0;
			enable = 1;
			clk = 1;
			watchdog = 0;

			
			while(i < 80) //clock ends when simulation loop ends
				begin
					#12500 //Half-period for 40MHz Clock Frequency
					clk = ~clk;
				end
		end
	
	always @ (posedge clk)
		begin
			#1000000100
			sw1_input = ~sw1_input;
			sw2_input = ~sw2_input;
			sw3_input = ~sw3_input;
		end
		
	always @ (j)
		begin
			if ((j >= 4 && j <= 6) || (j >= 15 && j <= 19) || j >= 75) watchdog = 0;
			else watchdog = 1;
		end
		
	always @ (j)
		begin
			if (j == 2 || j == 85) enable = 0;
			else enable = 1;
		end
		
	initial //Runs simulation time loop 
		begin
			for(i = 0; i < k; i = i + 1) //Cycles through millisecond delays
				begin
					#1000000000
					assign j = i;
				end
        
		$finish();
		end
endmodule