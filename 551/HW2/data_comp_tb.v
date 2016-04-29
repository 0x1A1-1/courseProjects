module data_comp_tb();

reg [7:0] serial_data, mask, match;
reg serial_vld;
wire prot_trig;

data_comp iDUT(.serial_data(serial_data), .serial_vld(serial_vld), .mask(mask), .match(match), .prot_trig(prot_trig));

initial 
begin
 serial_vld=1'h0;
 mask=8'h11111111;
 match=8'h00000000;
 serial_data=8'h00000000;
 #15;
 serial_vld=1'h1;
 mask=8'h11111111;
 match=8'h00000000;
 serial_data=8'h00000000;
 #15;
 serial_vld=1'h1; 
 mask=8'h00000000;
 match=8'h10101010;
 serial_data=8'h10101010;
 #15;
 serial_vld=1'h1;
 mask=8'h00000000;
 match=8'h01010101;
 serial_data=8'h11111111;
 #15;
 serial_vld=1'h1;
 mask=8'h10101010;
 match=8'h01010101;
 serial_data=8'h11111111;
 #15;
end

endmodule