library verilog;
use verilog.vl_types.all;
entity SDFSNQD1BWP is
    port(
        SI              : in     vl_logic;
        D               : in     vl_logic;
        SE              : in     vl_logic;
        CP              : in     vl_logic;
        SDN             : in     vl_logic;
        Q               : out    vl_logic
    );
end SDFSNQD1BWP;
