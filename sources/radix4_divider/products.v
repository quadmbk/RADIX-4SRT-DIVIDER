//This mosule is a ROM that stores all the possible product values

module products(input [2:0] q,
		input [25:0]d,
		output reg[25:0]qd
	       );
wire [25:0]  q2d, q_2d;

assign q2d = d << 1;
assign q_2d = ~q2d + 1'b1;

always @(q, d) begin
	case(q)
		3'b000 : qd <= 26'h0000_000;//q=0
		3'b001 : qd <= d; //q=1
		3'b010 : qd <= q2d;//q=2
		3'b110 : qd <= ~d + 1'b1;//q=-1
		3'b101 : qd <= q_2d;//q=-2
	endcase
end
endmodule
