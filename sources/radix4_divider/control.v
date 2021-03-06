//The control unit fsm

module control(input clk, resetn, start,
	       output reg loadR, loadD, loadRreg27, loadDreg27, shiftq, doneq,
	       output reg done ,// to indicate end of process
	       output  reg[31:0] count
		);

parameter IDLE   = 2'b00,
	  CALC_1 = 2'b01,
	  CALC_2 = 2'b10,
	  STOP   = 2'b11;

reg [1:0] current, next; 

reg reset_count, incr_count;

//reg [31:0] count; //a32 bit counter

//=======================//
//state-transition logic //
//=======================//
always @(posedge clk, negedge resetn)begin
	//reset_count = 0;
	if(resetn==1'b0)begin
		incr_count <= 1'b0;
		//count = 0;
		next <= IDLE;
	end		
	else begin
		current <= next;				
	end
end


//==========================//
// combinational logic      //
//==========================//
always @(current, next, start,count)begin
	reset_count = 1'b0;
	//dec_count   = 1'b0;
	loadR       = 1'b0;
	loadD       = 1'b0;
	loadDreg27  = 1'b0;
	loadRreg27  = 1'b0;
	shiftq	    = 1'b0;
	doneq	    = 1'b0;
 	next = IDLE;
	case(current)
		IDLE : begin
			incr_count = 1'b0;	
			//count = 32'h0000_0000;
			done = 1'b0;
			if(start == 1'b1) next = CALC_1;
			
			
		       end

		CALC_1 : begin
				loadDreg27 = 1'b1;
				loadRreg27 = 1'b1;
				incr_count  = 1'b1;
				//count = count + 1;
				shiftq     = 1'b1;
				next	   = CALC_2; 
			 end

		CALC_2 : begin
				loadR = 1'b1;
				loadD = 1'b1;
				//loadDreg27 = 1'b1;
				//loadRreg27 = 1'b1;
				//count = count + 1;
				incr_count  =1'b1;
				shiftq	   = 1'b1;
			
				if(count==32'h0000_0017)next = STOP;
				else next = CALC_2; 
			 end

		STOP  : begin
				done = 1'b1;
				doneq = 1'b1;
			end
 
		default: next = IDLE;
	endcase
end	

//count = (incr_count==1'b1)? count + 32'h0000_0001 : 32'h0000_0000;
always @(posedge clk)begin
	//if(reset_count) count = 32'h0000_0023;
	//else 
if(incr_count) count = count + 32'h0000_0001;
else count = 32'h0000_0000;
end
endmodule
