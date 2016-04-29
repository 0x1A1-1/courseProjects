module FirstFPGA(clk,RST_n,LED1,LED2);

input clk;			// 50MHz clock
input RST_n;		// unsynched reset from push button
output LED1,LED2;	// drives LEDs of DE0 nano board

wire rst_n;
wire [7:0] duty1,duty2;

//// Instantiate reset synchronizer ////
rst_synch iRST(.clk(clk), .RST_n(RST_n), .rst_n(rst_n));

//// Instantiate driver of duty cycles ////
dual_drv iDRV(.clk(clk), .rst_n(rst_n), .duty1(duty1), .duty2(duty2));

//// Instantiate your dual_PWM /////
dual_PWM iPWM(.clk(clk), .rst_n(rst_n), .VIH(duty2), .VIL(duty1),
              .VIH_PWM(LED2), .VIL_PWM(LED1));

endmodule
