// This module shifts the input by 2 digits to the left.

module sll4(input [25:0]in,
	    output [25:0] out
	   );

assign out = in << 2;
	
endmodule
