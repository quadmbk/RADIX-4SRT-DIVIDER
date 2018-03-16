//This module converts radix4 number into binary number
//returns the binary form of mantissa

/*
	0 = 000
	1 = 001
	2 = 010
       -1 = 110
       -2 = 101

*/

module r2bin(input [38:0]in,
	     output  [22:0]mantissa		
	    );

reg [25:0]pos,neg, temp_mantissa;
reg [2:0]buffer;

reg [32:0]i;
always @(in) begin
	for(i=0; i<39;i=i+3)begin
		buffer = in[2:0];
		case(buffer)
			3'b000 :begin pos[45:44] = 2'b00;neg[45:44]=2'b00;end //q=0
			3'b001 :begin pos[45:44] = 2'b01;neg[45:44]=2'b00;end //q=1
			3'b010 :begin pos[45:44] = 2'b10;neg[45:44]=2'b00;end //q=2
			3'b110 :begin neg[45:44] = 2'b01;pos[45:44]=2'b00;end//q=-1
			3'b101 :begin neg[45:44] = 2'b10;pos[45:44]=2'b00;end //q=-2
		endcase
		in=in>>3;
		pos=pos>>2;
		neg=neg>>2;	
	end
//At this point pos and neg contains values.
temp_manitssa = pos - neg;
end
assign mantissa = temp_mantissa[25:3];

endmodule
