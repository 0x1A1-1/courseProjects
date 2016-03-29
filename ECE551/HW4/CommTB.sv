module CommTB();

logic [15:0] cmd;
logic [15:0] cmd_out;
logic snd_cmd, cmd_cmplt, cmd_rdy, TX_RX;
logic clk, rst_n;

CommMaster iCM(.clk(clk), .rst_n(rst_n), .cmd_cmplt(cmd_cmplt), 
			.TX(TX_RX), .snd_cmd(snd_cmd), .cmd(cmd));
UART_wrapper iUART(.clk(clk), .rst_n(rst_n), .cmd_rdy(cmd_rdy), TX, RX(TX_RX), .cmd(cmd_out), 
			.send_resp(), .resp(), .clr_cmd_rdy(), .resp_sent());

initial begin
	clk=0;
	rst_n=0;
	cmd=16'h0000;
	snd_cmd = 0;
	//stable the signal with 50 clock cycle
	repeat(50) @(posedge clk);
	rst_n=1;
	
	for(i=0; i<8'hffff; i=i+1) begin
		wait(cmd_cmplt == 1) cmd = cmd + 1;
		@(negedge clk) rst_n = 1; snd_cmd = 1; 
		repeat(2) @(posedge clk); 
		@(negedge clk) rst_n = 0; snd_cmd = 0; 
		wait(cmd_rdy == 1) if(cmd !== cmd_out)
		begin
			$display("Oh no!"); //if any unmatching happens, stop the program
			$stop;
		end
	end
	$display("Passed!");
	$stop;
end			
			
always #1 clk = ~clk;
			
endmodule