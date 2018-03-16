//This module is a register of 27 bits with first 4 bits initialised 

module register27(input clk, resetn,
		  input [25:0] in, //the input value fromthe mux
	          input	load,      //the control signal
		  output reg [25:0] data_out // output of the register
		 );

always @(posedge clk, negedge resetn)begin
	if(resetn == 1'b0) data_out = 26'h0000000;
	else begin
		if(load)
			data_out <= in;
	end
end

endmodule
