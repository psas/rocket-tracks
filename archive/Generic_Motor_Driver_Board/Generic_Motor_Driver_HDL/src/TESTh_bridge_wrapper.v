module TESTh_bridge_wrapper();

reg clk, enable;
wire sw1_p, sw1_n, sw2_p, sw2_n, sw3_p, sw3_n;

integer i, j;
integer k = 20000;

	h_bridge_wrapper wrapper1(clk, enable, sw1_p, sw1_n, sw2_p, sw2_n, sw3_p, sw3_n);
	
	initial @ (j) //Assigns initial values and runs clk
		begin
			clk = 1;

			while(i < k) //clock ends when simulation loop ends
				begin
					#10 //Half-period for 50MHz Clock Frequency
					clk = ~clk;
				end
		end
		
	always @ (j)
		begin
			if (j < 20 || (j > 100 && j < 120)) enable = 0;
			else enable = 1;
		end
		
	initial //Runs simulation time loop 
		begin
			for(i = 0; i < k; i = i + 1) //Cycles through millisecond delays
				begin
					#1000000
					assign j = i;
				end
        
		$finish();
		end
endmodule