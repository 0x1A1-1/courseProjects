
// A. The code is incorrect since it doesn't update the output whenever there's a change in input

// B. D-FF with active high sync reset and an enable
module dff_sync_active_high(q, data, clk, reset, en);

output reg q;
input data, clk, reset, en;

always_ff @(posedge clk)
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

// C. D-FF with async active low reset and an active high enable
module dff_async_active_low(q, data, clk, reset, en);

output reg q;
input data, clk, reset, en;

always_ff @(posedge clk, negedge reset)
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

//D. J-K FF with active high sync reset
module J_K_ff( j ,k , clk, reset, q, qn);

output q,qn;
input j, k, clk, reset ;

always_ff @ (posedge (clk)) begin
	 if (reset)
		begin
		  q <= 0;
		  qn <= 1;
		end
	 else 
		begin
			if (j!=k) 
			begin
			   q <= j;
			   qn <= k;
			end
			else if (j==1 && k==1)
			begin
			   q <= ~q;
			   qn <= ~qn;
			end
		end
end

endmodule

///E. Always_ff does not ensure the generate of flop during simulation, but will warn the user if
// flip-flop isn't infered.