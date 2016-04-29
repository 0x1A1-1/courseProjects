library verilog;
use verilog.vl_types.all;
entity DFQD2BWP is
    port(
        D               : in     vl_logic;
        CP              : in     vl_logic;
        Q               : out    vl_logic
    );
end DFQD2BWP;
