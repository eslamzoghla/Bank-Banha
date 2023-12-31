module clock_divider (clk,reset,CLK10ms);
	// -------------------------- Inputs Declarations ---------------------------- //
	input clk,reset;
	// -------------------------- Outputs Declarations ---------------------------- //
	output reg CLK10ms;
	// -------------------------- Reg Declarations ---------------------------- //
	reg [22:0] count;
	// ----------------------- Sequential  Logic  -------------------------------- //
	always @(posedge clk or posedge reset)
		begin //--------------------------------------------------------------
			if(reset)
				begin 
					count<=0;
					CLK10ms<=0;
				end		
			else
				begin //-----------------------------------
				if(count < 5_000_000)
					count <= count + 1;
				else 
					begin //---------------------
						CLK10ms = ~CLK10ms; 
						count <= 0;
					end //-----------------------
				 end //-------------------------------------	
		end //-----------------------------------------------------------------
endmodule

	// ----------------------------- End of File --------------------------------- //
	// --------------------------------------------------------------------------- //
