library verilog;
use verilog.vl_types.all;
entity LNCNDD1BWP is
    port(
        D               : in     vl_logic;
        EN              : in     vl_logic;
        CDN             : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end LNCNDD1BWP;
