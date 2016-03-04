module firstFPGA_tb();

logic clk;			
logic RST_n;		
logic LED1,LED2;

FirstFPGA iDUT(.clk(clk),.RST_n(RST_n),.LED1(LED1),.LED2(LED2));

initial begin
	clk = 1;
	@(negedge clk)
	RST_n = 0;
	repeat(2) @(posedge clk)
	@(negedge clk)
	RST_n = 1;
end

always #1 clk=~clk;

endmodule
