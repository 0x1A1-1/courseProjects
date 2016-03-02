module UART_rx(clk, rst_n, RX, rdy, cmd, clr_rdy);

input clk, rst_n, clr_rdy, RX;
output logic rdy;
output logic [7:0] cmd;

logic [3:0] bit_counter;
logic [6:0] baud_cnt;
logic baud_rst, bit_rst, shift, trigger, data_rdy;

typedef enum reg {IDLE, LOAD} rx_state;
rx_state state, next_state;

		
//bit counter
always @(posedge clk, posedge bit_rst) begin
	if (bit_rst)
		bit_counter <= 4'b1000;
	if (shift)
		bit_counter <= bit_counter+1;
	else
		bit_counter <= bit_counter;
	end
		
//baud_cnt module
always @(posedge clk) begin
	if (baud_rst) 
		baud_cnt <= 7'b0000000;
	else 
		baud_cnt <=  baud_cnt +1;
	end

//trigger block
always @(negedge RX)begin
	trigger <= 1'b1;
end

//shift block
always @(posedge shift)begin
	cmd <= {cmd[6:0],RX};
end
	
assign rdy = data_rdy & !clr_rdy;

//state machine
always @(posedge clk, negedge rst_n)
	if (!rst_n) 
		state<=IDLE;
	else
		state<=next_state;
		
always_comb begin
	shift = 1'b0;
	bit_rst = 1'b0;
	case(state)
	IDLE:
		if (!rst_n) begin
			next_state = IDLE;
		end
		else if (trigger) begin
			data_rdy = 1'b0;
			next_state = LOAD;
		end
		else
			next_state = IDLE;
		
	LOAD:
		if (bit_counter==4'b1000) begin
			next_state = IDLE;
			data_rdy = 1'b1;	
			bit_rst = 1'b1;
		end
		else if (baud_cnt==7'b1101101) begin
			baud_rst = 1'b1;
			shift=1'b1;
			next_state =LOAD;
		end
		else begin
			next_state= LOAD;
		end
	endcase
end
		
endmodule
