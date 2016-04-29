library verilog;
use verilog.vl_types.all;
entity CMPE42D1BWP is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        D               : in     vl_logic;
        CIX             : in     vl_logic;
        S               : out    vl_logic;
        COX             : out    vl_logic;
        CO              : out    vl_logic
    );
end CMPE42D1BWP;
