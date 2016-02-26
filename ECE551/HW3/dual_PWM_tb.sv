module dual_PWM_tb();

reg clk, rst_n;
reg [7:0] VIL, VIH;
wire  VIL_PWM, VIH_PWM;

dual_PWM iDUT(.clk(clk), .rst_n(rst_n), .VIL(VIL), .VIL_PWM(VIL_PWM), .VIH(VIH), .VIH_PWM(VIH_PWM));

initial 
	begin
		clk=1'b1;
		rst_n=1'b0;
		#1;
		rst_n=1'b1;
		VIL=8'h00;
		VIH=8'h00;
	repeat(1024) @(posedge clk);
		VIL=8'h3f;
		VIH=8'hbf;
	repeat(1024) @(posedge clk);
	end

always #1 clk = ~clk;


endmodule
