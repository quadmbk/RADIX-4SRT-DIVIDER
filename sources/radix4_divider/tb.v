//this is the testbench

module tb;
reg clk, resetn, start;

reg Rsign, Dsign;
reg [7:0] Dexp, Rexp;
reg [22:0]Dmantissa, Rmantissa;

wire [31:0] q;

top divider ( clk, resetn, start,
              Rsign, 
              Rexp,
              Rmantissa,
              Dsign, 
              Dexp,
              Dmantissa,
              q
          );

initial begin
	clk = 0;
	forever #1 clk = ~clk;	
end

initial begin
	resetn = 1;
	#2 resetn = 0;
	#6 resetn = 1;
	#2 Rsign  = 1'b0;
	   Dsign  = 1'b0;
	   Rexp   = 8'h03;
	   Dexp   = 8'h03;
	   Rmantissa = 23'b1101_0000_0000_0000_0000_000;
	   Dmantissa = 23'b1110_0000_0000_0000_0000_000;
	   start     = 1'b1;
	//#2 start     = 1'b0;

#200 $stop;
end

endmodule	
