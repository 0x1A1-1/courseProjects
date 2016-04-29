module data_comp(serial_data, serial_vld, mask, match, prot_trig);

input [7:0] serial_data, mask, match;
input serial_vld;
output prot_trig;

wire [7:0]  match_mask;
wire match_check;

assign match_mask = (( match) ~^ (serial_data )) | mask;
assign match_check = (match_mask==8'hff)? 1'b1:1'b0;
assign prot_trig = (serial_vld == 1) ? match_check : 1'bz ;

endmodule

