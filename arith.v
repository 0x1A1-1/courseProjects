module arith(cout, sum, ov, sub, a, b);

output [7:0] sum;
output ov, cout;
input [7:0] a, b;
input sub;

wire [7:0]b_mid;

xor (b_mid[0], b[0], sub);
xor (b_mid[1], b[1], sub);
xor (b_mid[2], b[2], sub);
xor (b_mid[3], b[3], sub);
xor (b_mid[4], b[4], sub);
xor (b_mid[5], b[5], sub);
xor (b_mid[6], b[6], sub);
xor (b_mid[7], b[7], sub);

add8bit mod(.a(a),.b(b_mid),.cin(sub), .sum(sum), .cout(cout), .ov(ov));

endmodule
