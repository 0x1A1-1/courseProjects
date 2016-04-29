library verilog;
use verilog.vl_types.all;
entity CKMUX2D0BWP is
    port(
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        S               : in     vl_logic;
        Z               : out    vl_logic
    );
end CKMUX2D0BWP;
