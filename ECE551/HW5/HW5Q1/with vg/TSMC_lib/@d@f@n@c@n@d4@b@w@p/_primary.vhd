library verilog;
use verilog.vl_types.all;
entity DFNCND4BWP is
    port(
        D               : in     vl_logic;
        CPN             : in     vl_logic;
        CDN             : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end DFNCND4BWP;
