module UART_rx(clk, rst_n, RX, rdy, rx_data, clr_rx_rdy); // rx_data to cmd, clr_rx_rdy to clr_rdy 
input clk, rst_n, clr_rx_rdy, RX;
output logic rdy;
output logic [7:0] rx_data;

//define state machine
typedef enum reg {IDLE, LOAD} rx_state;
rx_state state, next_state;

logic [8:0] shift_reg;
logic [3:0] bit_counter;
logic [6:0] baud_cnt;
//declare intermediate wire and signal 
logic start, set_rx_rdy, receiving;
logic rx_ff1, rx_ff2;
logic shift;

		
//bit counter flip flop module
always @(posedge clk, negedge rst_n) begin
	if (!rst_n)
		bit_counter <= 4'b0000;
	else if (start)
		bit_counter <= 4'b0000;
	else
		bit_counter <= bit_counter+1;
	end
		
assign shift = &baud_cnt;

//baud_cnt flip flop module
always @(posedge clk, negedge rst_n) begin
	if (!rst_n)
		baud_cnt <= 7'h4A;
	else if (start) 
		baud_cnt <= 7'h4A;
	else if (shift)
		baud_cnt <= 7'h13;
	else if (receiving)
		baud_cnt <=  baud_cnt +1;
	end

//shift flip flop block
always @(posedge clk) begin
	if (shift)
		shift_reg <= {RX, shift_reg[8:1]}; //LSB in first
end

//implement rdy signal
always @(posedge clk, negedge rst_n) begin
	if (!rst_n)
		rdy <= 1'b0;
	else if (start || clr_rx_rdy)
		rdy <= 1'b0;
	else if (set_rx_rdy)
		rdy <= 1'b1;
end

//double flop RX for meta-stability 
always_ff @(posedge clk, negedge rst_n) begin 
	if(!rst_n) begin
		rx_ff1 <= 1'b1; 
		rx_ff2 <= 1'b1;
	end else begin
		rx_ff1 <= RX; 
		rx_ff2 <= rx_ff1;
	end
end 

//state machine
always @(posedge clk, negedge rst_n)
	if (!rst_n) 
		state<=IDLE;
	else
		state<=next_state;

assign rx_data = shift_reg[7:0];

//state machine logic
always_comb begin
	start = 0;
	set_rx_rdy = 0;
	receiving = 0;
	next_state = IDLE ;
	case(state)
	IDLE:	begin
		if(!rx_ff2) begin
			next_state = LOAD;
			start = 1;
		end else
		next_state = IDLE;
	end
		
	LOAD: begin
		if (bit_counter == 4'b1010) begin
			set_rx_rdy = 1;
			next_state = IDLE;
		end else
			next_state = LOAD;
		receiving = 1;
	end 	
	endcase
end
		
endmodule
