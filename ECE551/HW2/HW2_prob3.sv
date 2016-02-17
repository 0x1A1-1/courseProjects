/*
a. The code is incorrect since it doesn't update the output whenever there's a 
	change in input
*/

// D-FF with active high sync reset and an enable
module dff_sync_active_high(q, data, clk, reset, en);

output reg q;
input data, clk, reset, en;


always @(posedge clk)
	if (reset) 
	begin
		q <= 1'b0;
	end	
	else if (en)
	begin
		q <= data;
	end
	else
	begin
		q <= q;
	end

endmodule

// D-FF with async active low reset and an active high enable
module dff_async_active_low(q, data, clk, reset, en);

output reg q;
input data, clk, reset, en;

always @(posedge clk, negedge reset)
	if (~reset) 
	begin 
		q <= 1'b0;
	end	
	else if (en)
		begin
		q <= data;
	end
	else
	begin
		q <= q;
	end
endmodule

//
module JK_flip_flop ( j ,k ,clk , reset ,q , qb);

output q, qb ;
input j, k, clk, reset ;


always @ (posedge (clk)) begin
 if (reset) begin
  q <= 0;
  qb <= 1;
 end
 else 
 begin
  if (j!=k) 
  begin
   q <= j;
   qb <= k;
  end
  else if (j==1 && k==1)
  begin
   q <= ~q;
   qb <= ~qb;
  end
 end
end

endmodule