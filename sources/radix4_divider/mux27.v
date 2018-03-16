//This i the mltiplexor before he 27 bit registers

module mux27(input [25:0] data1, //the data on first line 
		   	  data2, // the data on second line
	     input select,
	     output [25:0] data_out		
	    );

assign data_out = (select==1'b1)? data2 : data1;

endmodule
