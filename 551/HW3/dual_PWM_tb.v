module dual_PWM_tb();

reg clk, rst_n;
reg [7:0] VIL, VIH; //input signal
wire  VIL_PWM, VIH_PWM;

//initialize dual PWM module 
dual_PWM iDUT(.clk(clk), .rst_n(rst_n), .VIL(VIL), .VIL_PWM(VIL_PWM), .VIH(VIH), .VIH_PWM(VIH_PWM));

initial 
	begin
		clk=1'b1;
		rst_n=1'b0;
		#1;
		rst_n=1'b1;
		VIL=8'h00;
		VIH=8'h00;
	repeat(512) @(posedge clk); //hold the value for 512 clock cycle unttil change happens
		VIL=8'h3f;
		VIH=8'hbf;
	repeat(512) @(posedge clk);//hold the value for 512 clock cycle unttil change happens
		VIL=8'h7f;
		VIH=8'hbf;
	repeat(512) @(posedge clk);//hold the value for 512 clock cycle unttil change happens
		VIL=8'h3f;
		VIH=8'hbf;
	repeat(512) @(posedge clk);//hold the value for 512 clock cycle unttil change happens
		VIL=8'h3f;
		VIH=8'h7f;
	end

always #1 clk = ~clk;


endmodule
