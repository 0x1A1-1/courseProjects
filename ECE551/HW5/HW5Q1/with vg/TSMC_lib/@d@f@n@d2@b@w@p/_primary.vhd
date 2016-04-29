library verilog;
use verilog.vl_types.all;
entity DFND2BWP is
    port(
        D               : in     vl_logic;
        CPN             : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end DFND2BWP;
