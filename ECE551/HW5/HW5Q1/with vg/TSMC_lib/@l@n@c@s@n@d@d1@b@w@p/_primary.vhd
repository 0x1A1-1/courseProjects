library verilog;
use verilog.vl_types.all;
entity LNCSNDD1BWP is
    port(
        D               : in     vl_logic;
        EN              : in     vl_logic;
        CDN             : in     vl_logic;
        SDN             : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end LNCSNDD1BWP;
