library verilog;
use verilog.vl_types.all;
entity BMLD1BWP is
    port(
        X2              : in     vl_logic;
        A               : in     vl_logic;
        S               : in     vl_logic;
        M0              : in     vl_logic;
        M1              : in     vl_logic;
        PP              : out    vl_logic
    );
end BMLD1BWP;
