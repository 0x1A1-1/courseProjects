module FeFF_tb();

reg clk,d,RST;

wire q;

FeFF iDUT(.q(q),.d(d),.clk(clk),.RST(RST));

initial
	begin
		RST=1;
		#10;
		RST=0;
		clk=0;
		d=0;
	end

	always #15 clk = ~clk;
	always #45 d = ~d;


endmodule;