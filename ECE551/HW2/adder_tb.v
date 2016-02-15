module b_mon_4bia_mondder();

reg [3:0] a_mon,b_mon; 
reg cin_mon; //initialise test vector
wire [3:0] sum_mon; 
wire cout_mon;

adder ad4(.sum(sum_mon), .cout(cout_mon),.a(a_mon), .b(b_mon), .cin(cin_mon));
initial
begin
#0 a_mon=4¡¯b0000; b_mon=4¡¯b0000; cin_mon=1¡¯b0;
#10 a_mon=4¡¯b0100; b_mon=4¡¯b0011; cin_mon=1¡¯b1;
#20 a_mon=4¡¯b0011; b_mon=4¡¯b0111; cin_mon=1¡¯b1;
#30 a_mon=4¡¯b1000; b_mon=4¡¯b0100; cin_mon=1¡¯b0;
#40 a_mon=4¡¯b0101; b_mon=4¡¯b0101; cin_mon=1¡¯b1;
end

endmodule
 