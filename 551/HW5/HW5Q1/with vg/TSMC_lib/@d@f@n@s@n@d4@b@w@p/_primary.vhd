library verilog;
use verilog.vl_types.all;
entity DFNSND4BWP is
    port(
        D               : in     vl_logic;
        CPN             : in     vl_logic;
        SDN             : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end DFNSND4BWP;
