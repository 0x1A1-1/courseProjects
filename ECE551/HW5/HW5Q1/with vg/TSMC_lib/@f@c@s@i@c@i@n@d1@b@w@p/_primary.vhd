library verilog;
use verilog.vl_types.all;
entity FCSICIND1BWP is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        CIN0            : in     vl_logic;
        CIN1            : in     vl_logic;
        CS              : in     vl_logic;
        S               : out    vl_logic;
        CO0             : out    vl_logic;
        CO1             : out    vl_logic
    );
end FCSICIND1BWP;
