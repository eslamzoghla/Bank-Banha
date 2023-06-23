module flip_flop (reset,flip_in,clk,flip_out);
	// -------------------------- Inputs Declarations ---------------------------- //
	input reset,flip_in,clk;
	// -------------------------- Outputs Declarations ---------------------------- //
	output flip_out;
	// -------------------------- Reg Declarations ---------------------------- //
	reg flip_out;
	
	
	always @(posedge clk or posedge reset)
		begin
			if(reset)
				flip_out<=0;
			else
				flip_out<=~ flip_in;
		end
endmodule