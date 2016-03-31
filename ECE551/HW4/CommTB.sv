module CommTB();

logic [15:0] cmd;
logic [15:0] cmd_out;
logic snd_cmd, send_resp, cmd_cmplt, cmd_rdy, TX_RX, clr_cmd_rdy;
logic clk, rst_n;
integer i;

CommMaster iCM(.clk(clk), .rst_n(rst_n), .cmd_cmplt(cmd_cmplt), 
			.TX(TX_RX), .snd_cmd(snd_cmd), .cmd(cmd));
UART_wrapper iUART(.clk(clk), .rst_n(rst_n), .cmd_rdy(cmd_rdy), .RX(TX_RX), .cmd(cmd_out), 
			.send_resp(send_resp), .TX(), .resp(), .clr_cmd_rdy(), .resp_sent());

initial begin
	clk=0;
	rst_n=0;
	cmd=16'h0001;
	snd_cmd = 0;
	//stable the signal with 50 clock cycle
	repeat(50) @(posedge clk);
	rst_n=1;
	snd_cmd = 1;
	/* repeat(50) @(posedge clk);
	snd_cmd = 0; */
	
	/* repeat(50) @(posedge clk);
	snd_cmd = 0;
	
	repeat(4000) @(posedge clk);
	cmd=16'h4567;
	snd_cmd = 1;
	repeat(50) @(posedge clk);
	snd_cmd = 0;
	 */
	
	for(i=0; i<8'hffff; i=i+1) begin
		wait(cmd_cmplt == 1) if(cmd !== cmd_out)
		begin
			$display("Oh no!", cmd, cmd_out); //if any unmatching happens, stop the program
			$stop;
		end 
		cmd = cmd + 1;  
		@(negedge clk) rst_n = 1;  snd_cmd = 1;//send_resp = 1;
		repeat(2) @(posedge clk); 
		@(negedge clk) snd_cmd = 0; clr_cmd_rdy = 0; //send_resp = 0;
		wait(cmd_rdy == 1) ;
	end
	$display("Passed!");
	$stop;
end			
			
always #1 clk = ~clk;
			
endmodule
