library verilog;
use verilog.vl_types.all;
entity SEDFQD1BWP is
    port(
        E               : in     vl_logic;
        SE              : in     vl_logic;
        CP              : in     vl_logic;
        SI              : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end SEDFQD1BWP;
