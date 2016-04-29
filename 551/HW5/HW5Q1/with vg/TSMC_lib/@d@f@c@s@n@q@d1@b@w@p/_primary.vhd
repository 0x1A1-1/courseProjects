library verilog;
use verilog.vl_types.all;
entity DFCSNQD1BWP is
    port(
        D               : in     vl_logic;
        CP              : in     vl_logic;
        CDN             : in     vl_logic;
        SDN             : in     vl_logic;
        Q               : out    vl_logic
    );
end DFCSNQD1BWP;
