module adder(sum, cout, a, b, cin);
input[3:0] a,b;
input cin;
output [3:0] sum;
output cout;

wire [4:0] SE;

assign SE=a+b+cin;
assign cout = SE[4];
assign sum = SE[3:0];
  
endmodule
