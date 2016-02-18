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
    waddr = 9'h002;
	raddr = 9'h000;
	wdata = 8'h01;
   	#20;
	we=1;
end 

always 
begin
   #10 clk = ~clk;
   #20;
     waddr<=waddr+1'h1;
     raddr<=raddr+1'h1;
	wdata<=wdata+1'h1;
end
   
endmodule
