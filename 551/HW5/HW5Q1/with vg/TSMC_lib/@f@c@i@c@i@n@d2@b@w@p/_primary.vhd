library verilog;
use verilog.vl_types.all;
entity FCICIND2BWP is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        CIN             : in     vl_logic;
        CO              : out    vl_logic
    );
end FCICIND2BWP;
