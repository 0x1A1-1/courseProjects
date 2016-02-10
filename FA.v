module FA(cout, sum, a, b, cin );
// I/O port declarations
input a, b, cin;
output sum, cout;
wire s1, n1, n2, n3;

xor (s1, a, b); // compute sum.
xor (sum, s1, cin);
and (n1, a, b); // compute carry out.
and (n2, a, cin);
and (n3, y, cin);
or (cout, n1, n2, n3);

endmodule