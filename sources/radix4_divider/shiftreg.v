//This module is a 27*3 = 81  bit shift register sipo

module shift_reg(input clk, resetn, 
		 input [2:0]in, //radix 4 input digit
	  	 input shift  ,done, //shifting control signal, to take parallel data out
		 output  [70:0] data_out
		);
reg [70:0]temp;

always @(posedge clk, negedge resetn)begin
	if(resetn==1'b0)begin
		temp = 80'h0000000;
	end
	else begin
		if(shift)
			temp <= {temp[67:0],in};
		
	end
end

assign data_out = (done==1'b1) ? temp : 'hz;

endmodule
