//This module stores is a 32 bit register to store the value in single precision IEEE 754 format.

// -----------------------------------------------------------
// | S   |	E	|	MANTISSA		     |
// | 	 |		|				     |
// -----------------------------------------------------------

module register754(input clk,resetn,
	input sign, //the 1 bit sign bit
	      [7:0]exp, // 8 bit exponent field
	      [22:0]mantissa,
	output reg [31:0] floating
	);



always @(posedge clk, negedge resetn)begin
	if(resetn == 1'b0)
		floating = 32'h0000_0000;
	else
		floating = {sign, exp, mantissa};
end
	
endmodule
