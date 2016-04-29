module trigger_logic_tb();
//testbench for trigger_logic

reg CH1Trig, CH2Trig, CH3Trig, CH4Trig, CH5Trig, proTrig;
reg armed, set_capture_done, clk, rst_n;
wire triggered;

// initialize the iDUT module
trigger_logic iDUT(.CH1Trig(CH1Trig),.CH2Trig(CH2Trig),.CH3Trig(CH3Trig),.CH4Trig(CH4Trig),.CH5Trig(CH5Trig),.proTrig(proTrig),.armed(armed),.set_capture_done(set_capture_done),.clk(clk),.rst_n(clk),.triggered(triggered));

initial 
	begin
		rst_n=1'b0; //reset the flip flop
		clk=1'b1;
		#10;		//start atest case
		rst_n=1'b1;
		armed = 1'b0;
		set_capture_done=1'b0;
		CH1Trig=1'b1;
		CH2Trig=1'b1;
		CH3Trig=1'b1;
		CH4Trig=1'b1;
		CH5Trig=1'b1;
		proTrig=1'b1;
		#200				//start another test case
		CH1Trig=1'b1;
		CH2Trig=1'b1;
		CH3Trig=1'b0;
		CH4Trig=1'b1;
		CH5Trig=1'b1;
		proTrig=1'b1;
	end
 
always #5 clk=~clk;
always #10 armed=~armed;
always #20 set_capture_done=~set_capture_done;

endmodule
