module adder_4b(sum, cout, A, B, cin);
input[3:0] A,B;
input cin;
output [3:0] sum;
output cout;

wire [4:0] SE;

assign SE=A+B+cin;
assign cout = SE[4];
assign sum = SE[3:0];
  
endmodule
