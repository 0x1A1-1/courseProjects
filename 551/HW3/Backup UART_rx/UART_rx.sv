module UART_rx(clk, rst_n, RX, rdy, cmd, clr_rdy);

input clk, rst_n, clr_rdy, RX;
output logic rdy;
output logic [7:0] cmd;

logic [3:0] bit_counter;
logic [6:0] baud_cnt;
//declare intermediate wire and signal 
logic baud_rst, bit_rst, shift, trigger, data_rdy;

//define state machine
typedef enum reg {IDLE, LOAD} rx_state;
rx_state state, next_state;

		
//bit counter flip flop module
always @(posedge clk) begin
	if (bit_rst)
		bit_counter <= 4'b0000;
	else if (shift)
		bit_counter <= bit_counter+1;
	else
		bit_counter <= bit_counter;
	end
		
//baud_cnt flip flop module
always @(posedge clk) begin
	if (baud_rst) 
		baud_cnt <= 7'b0000000;
	else 
		baud_cnt <=  baud_cnt +1;
	end

//trigger block detect the falling edge of RX
always @(negedge RX)begin
	if (state==IDLE)
		trigger <= 1'b1;
	else
		trigger <= 1'b0;
end

//shift flip flop block
always @(posedge clk)begin
	if (shift)
		cmd <= {RX,cmd[7:1]};
	else
		cmd <= cmd;
end
	
assign rdy = data_rdy?(clr_rdy? 0: 1):0; //output logic of rdy signal

//state machine
always @(posedge clk, negedge rst_n)
	if (!rst_n) 
		state<=IDLE;
	else
		state<=next_state;

//state machine logic
always_comb begin
	shift = 1'b0;		//reset shif sinal at every iteration
	case(state)
	IDLE:	begin
		bit_rst = 1'b1;
		baud_rst = 1'b1;
		if (!rst_n) begin		//reset state to IDLE if rst_n is low
			next_state = IDLE;
		end
		else if (trigger) begin		//if falling edge of RX is detect, start reading
			bit_rst = 1'b0;
			baud_rst = 1'b1;
			data_rdy = 1'b0;
			next_state = LOAD;
		end
		else
			next_state = IDLE;
	end
		
	LOAD:
		if (bit_counter==4'b1000) begin //if loading is finished, return to IDLE state
			next_state = IDLE;
			data_rdy = 1'b1;	
		end
		else if (baud_cnt==7'b1101101) begin //if baud rate is 109, go to next bit
			baud_rst = 1'b1;
			shift=1'b1;
			next_state =LOAD;
		end
		else begin		 		//reading one bit within determined baud rate
			baud_rst = 1'b0;
			next_state= LOAD;
		end
	endcase
end
		
endmodule
