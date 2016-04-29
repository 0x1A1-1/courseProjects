library verilog;
use verilog.vl_types.all;
entity SDFQND4BWP is
    port(
        SI              : in     vl_logic;
        D               : in     vl_logic;
        SE              : in     vl_logic;
        CP              : in     vl_logic;
        QN              : out    vl_logic
    );
end SDFQND4BWP;
