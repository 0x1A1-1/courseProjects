module RAMqueue_tb();

reg clk, we;
 
reg[8:0] raddr, waddr;
reg[7:0] wdata;
wire [7:0] rdata;

// Instantiate DUT //
RAMqueue iDUT(.clk(clk), .we(we),  .waddr(waddr),
                  .raddr(raddr),.wdata(wdata), .rdata(rdata));


initial 

begin
    clk = 0;
    we = 0; //start turned off
    waddr = 9'b 0_0000_0000;
	raddr = 9'b 0_0000_0000;
   	 #5;
	waddr = 0'h123;
	#10;
	waddr = 0'h124;
	#20;
	waddr = 0'h125;
	#10;
	waddr = 0'h126;
end
    
initial
	begin
	#5;
	we=1;
	raddr = 0'h123;
	#20;
	we=0;
	raddr = 0'h124;
	#10;
	we=1;
	#10;
	we=0;
	waddr = 0'h125;
	end

initial
	begin
	#5;
	wdata = 0'hXX;
	#10;
	wdata = 0'hAB;
	#10;
	wdata = 0'hCD;
	#10;
	wdata = 0'hEF;
	#10;
	wdata = 0'hXX;
	end
	
always
   #10 clk = ~clk;
   
   
endmodule