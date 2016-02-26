module trigger_logic(CH1Trig,CH2Trig,CH3Trig,CH4Trig,CH5Trig,proTrig, armed, set_capture_done, clk, rst_n, triggered);

input CH1Trig, CH2Trig, CH3Trig, CH4Trig, CH5Trig, proTrig;
input logic armed, set_capture_done, clk, rst_n;
output logic triggered;

logic trig_set;

assign trig_set = CH1Trig & CH2Trig & CH3Trig & CH4Trig & CH5Trig & proTrig;


always @(posedge clk, negedge rst_n)
	if (!rst_n)
		triggered <= 1'b0;
	else
		//triggered <= (((trig_set & armed) ~| triggered ) ~| set_capture_done);
		triggered <= ~(set_capture_done | ~( triggered | (trig_set & armed)));
endmodule
