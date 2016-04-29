library verilog;
use verilog.vl_types.all;
entity LHCSNDQD4BWP is
    port(
        D               : in     vl_logic;
        E               : in     vl_logic;
        CDN             : in     vl_logic;
        SDN             : in     vl_logic;
        Q               : out    vl_logic
    );
end LHCSNDQD4BWP;
