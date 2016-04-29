module trigger_logic(CH1Trig,CH2Trig,CH3Trig,CH4Trig,CH5Trig,proTrig, armed, set_capture_done, clk, rst_n, triggered);
//this module implements the trigger logic 

input CH1Trig, CH2Trig, CH3Trig, CH4Trig, CH5Trig, proTrig;
input logic armed, set_capture_done, clk, rst_n;
output logic triggered;

logic trig_set;	//intermediate wire 

assign trig_set = CH1Trig & CH2Trig & CH3Trig & CH4Trig & CH5Trig & proTrig; //determine if trig_set need to be set

always @(posedge clk, negedge rst_n)
	if (!rst_n)
		triggered <= 1'b0;	//reset the flipflop if rst_n is low 
	else
		triggered <= ~(set_capture_done | ~( triggered | (trig_set & armed))); //the ouput logic
endmodule
