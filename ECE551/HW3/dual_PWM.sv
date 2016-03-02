module dual_PWM(clk, rst_n, VIL, VIL_PWM, VIH, VIH_PWM);

input clk, rst_n;
input [7:0] VIL, VIH;
output  VIL_PWM, VIH_PWM;

// construct dual pwm by initialize two pwm module
pwm8 pwm_H(.PWM_sig(VIH_PWM), .clk(clk), .rst_n(rst_n), .duty(VIH));
pwm8 pwm_L(.PWM_sig(VIL_PWM), .clk(clk), .rst_n(rst_n), .duty(VIL));

endmodule
