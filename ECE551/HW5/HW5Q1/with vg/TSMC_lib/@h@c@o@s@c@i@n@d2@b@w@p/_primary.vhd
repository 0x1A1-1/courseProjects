library verilog;
use verilog.vl_types.all;
entity HCOSCIND2BWP is
    port(
        A               : in     vl_logic;
        CIN             : in     vl_logic;
        CS              : in     vl_logic;
        S               : out    vl_logic;
        CO              : out    vl_logic
    );
end HCOSCIND2BWP;
