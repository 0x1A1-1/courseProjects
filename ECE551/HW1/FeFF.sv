module FeFF(q, clk, d, RST);

input clk, d, RST;
output q;

reg q;
wire md,mq,sd;

notif1 #1 tri_1(md, d, clk);
not (mq, md);
not (weak0,weak1) (md,mq);


notif1 #1 tri_2(sd, mq, ~clk);
not (q, sd);
not (weak0,weak1) (sd,q);

always @(negedge RST)
    begin
        if (RST)
            q <= 0;
    end

endmodule;