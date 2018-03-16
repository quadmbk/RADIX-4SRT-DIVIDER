//This ia a 27- bit full subtrctor

module subtractor(input [25:0] a,b,
		  output [25:0]diff //the inputs are in two's complement form
		 );
wire [26:0] cin;
assign cin[0] = 1'b0;

genvar i;
generate begin
	for(i=0;i<26;i=i+1)
		fs f (a[i],b[i],cin[i], diff[i],cin[i+1]); 
end		
endgenerate
endmodule

//==================================//
//	1 BIT FULL SUBTRACTOR	    //
//==================================//

module fs(input a,b,c, //one bit operands
	  output diff,borr
	 );

assign diff = a ^ b ^c ;
assign borr = (~a & b) | (b & c) | (~a & c);

endmodule

module subtb;
reg [26:0] a,b;
wire [26:0] diff;

subtractor s(a,b,diff);

initial 
	$monitor("@%t ns: a= %d, b = %d, diff=%d",$time, a,b,diff);
initial begin
	a =27'h0000002;
	b = 27'b111_1111_1111_1111_1111_1111_1111;

#2
	a = 27'b111111111111111111111111111;
	b = 27'h0000002;
	
#2
	a = 27'h0000002;
	b = 27'h0000002;
	

end
endmodule
