module ss_A2D_SM(clk,rst_n,strt_cnv,smp_eq_8,gt,clr_dac,inc_dac,
                 clr_smp,inc_smp,accum,cnv_cmplt);

  input clk,rst_n;			// clock and asynch reset
  input strt_cnv;			// asserted to kick off a conversion
  input smp_eq_8;			// from datapath, tells when we have 8 samples
  input gt;					// gt signal, has to be double flopped
  
  output logic clr_dac;			// clear the input counter to the DAC
  output logic inc_dac;			// increment the counter to the DAC
  output logic clr_smp;			// clear the sample counter
  output logic inc_smp;			// increment the sample counter
  output logic accum;				// asserted to make accumulator accumulate sample
  output logic cnv_cmplt;			// indicates when the conversion is complete

  ////////////////////////////////////////
  // You fill in the SM implementation //
  typedef enum reg [1:0] {IDLE,CONV,ACCUM} state_t;
  state_t state, next_state;

  //state machine
  always_ff @(posedge clk, negedge rst_n)
    if(!rst_n)
      state <= IDLE;
    else
      state <= next_state;

  //state machine logic
  always_comb begin
  //reset some signal at each iteration
  clr_dac = 1'b0;
  inc_dac = 1'b0;
  clr_smp = 1'b0;
  inc_smp = 1'b0;
  accum = 1'b0;
  cnv_cmplt = 1'b0;
  
  case(state)
  IDLE:
	if(strt_cnv) begin		//go to next state if start signal is asserted
	next_state = CONV;
	clr_dac = 1'b1;
	clr_smp = 1'b1;
	end
	else begin
	next_state = IDLE;
	end
	
  CONV:
	if (gt) begin		//if gt is asserted go to next state
		next_state = ACCUM;
		accum =1'b1;
	end
	else begin
		inc_dac = 1'b1;
		next_state= CONV;
	end
	
  ACCUM:
	if (smp_eq_8) begin		//if 8 sample is finished, go back to IDLE state
		cnv_cmplt= 1'b1;
		next_state= IDLE;
	end
	else begin
		next_state = CONV;
		clr_dac=1'b1;
		inc_smp=1'b1;
	end
	
  default:
	next_state = IDLE;
  endcase

  end
  //////////////////////////////////////
  

endmodule
  
					   