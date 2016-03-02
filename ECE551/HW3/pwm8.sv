module pwm8(PWM_sig, clk, rst_n, duty);

input [7:0] duty;
input clk, rst_n;
output reg PWM_sig;

logic [7:0] cnt;
logic set, reset;

// 8 bit counter
always @(posedge clk or negedge rst_n) begin
	assign cnt = (!rst_n) ? 8'h00: cnt + 1; 
end

// generate set and reset signal for flip flop
always @(cnt) begin
 	assign reset = (cnt==duty)? 1:0;
	assign set = (&cnt==0'b1)? 1:0;
end

//flip flop that generates PWM_sig 
always @(posedge clk or negedge rst_n) begin
	if (!rst_n)
	PWM_sig <= 1'b0;
	else if (reset)
	PWM_sig <= 1'b0;
	else if (set)
	PWM_sig <= 1'b1;
	else 
	PWM_sig <= PWM_sig;
end

endmodule
