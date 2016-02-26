module UART_rx(clk, rst_n, RX, rdy, cmd, clr_rdy);

input clk, rst_n, clr_rdy, RX;
output logic rdy;
output logic [7:0] cmd;

logic [3:0] counter;

typedef enum reg {IDLE, LOAD} rx_state;
rx_state state, next_state;

always @(posedge clk, negedge rst_n)
	if (!rst_n) 
		state<=IDLE;
	else
		state<=next_state;
		
always_comb begin
	rdy = 1'b0;
	counter = 4'b0000;
	cmd=8'b00000000;
	case(state)
	IDLE:
		if (clr_rdy | !rst_n) begin
			rdy = 1'b0; 
			next_state = IDLE;
		end
		else 
			next_state = LOAD;
		
	LOAD:
		if (counter==4'b1000) begin
			next_state = IDLE;
			rdy = 1'b1;	
			counter = 4'b0000;
		end
		else begin
			counter = counter + 1;
			cmd = {cmd[6:0],RX};
			next_state= LOAD;
		end
	endcase
end
		
endmodule