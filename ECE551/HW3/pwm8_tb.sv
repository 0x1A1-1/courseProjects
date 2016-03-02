module pwm8_tb();

reg clk, rst_n;
reg [7:0] duty;
wire out;
//initialize pwm8 module
pwm8 iDUT(.PWM_sig(out), .clk(clk), .rst_n(rst_n), .duty(duty));

initial 
	begin
		clk=1'b1;
		rst_n=1'b0;
		#1;
		rst_n=1'b1;
		duty=8'h00;					//set duty cycle at 8'h00 --> 0%
	repeat(1024) @(posedge clk);
		duty=8'hbf;					//set duty cycle at 8'hbf --> 75%
	repeat(1024) @(posedge clk);
	end

always #1 clk = ~clk;

endmodule