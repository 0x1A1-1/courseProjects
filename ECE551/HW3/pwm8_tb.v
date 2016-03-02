module pwm8_tb();

reg clk, rst_n;
reg [7:0] duty; //duty cycle
wire out;

//initialize iDUT
pwm8 iDUT(.PWM_sig(out), .clk(clk), .rst_n(rst_n), .duty(duty));

initial 
	begin
		clk=1'b1;
		rst_n=1'b0;
		#1;
		rst_n=1'b1;
		duty=8'h00;
	repeat(1024) @(posedge clk); //repeat duty cycle for 1024 clock
		duty=8'hbf;
	repeat(1024) @(posedge clk);
	end

always #1 clk = ~clk;

endmodule