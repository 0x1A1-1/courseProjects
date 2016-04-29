library verilog;
use verilog.vl_types.all;
entity GMUX2D2BWP is
    port(
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        S               : in     vl_logic;
        Z               : out    vl_logic
    );
end GMUX2D2BWP;
