//This is the top module containing datapath, control unit instantiations

module top(input clk, resetn, start,
	   input Rsign,
	   input [7:0]Rexp,
	   input [22:0]Rmantissa,
	   input Dsign,
	   input [7:0]Dexp,
	   input [22:0]Dmantissa,
	   output [31:0]q
	  );
wire [31:0] count;

wire loadR, loadD, loadRreg27, loadDreg27, shiftq, doneq, done;


 control   cu
	      ( clk, resetn, start,

	        loadR, loadD, loadRreg27, loadDreg27, shiftq, doneq,

	        done ,count// to indicate end of process

	      );

datapath  dp
	      (	 Rsign,			//Take dividend and Divisor

		 Rexp,

		 Rmantissa,

	   	 Dsign,

		 Dexp,

		 Dmantissa,

	   	 clk, resetn,loadR, loadD,loadRreg27, loadDreg27,shiftq,doneq,

	   	 q[22:0]

	   	

	  );
endmodule
