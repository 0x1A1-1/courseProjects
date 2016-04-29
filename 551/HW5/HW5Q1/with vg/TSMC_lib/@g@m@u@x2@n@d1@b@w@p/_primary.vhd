library verilog;
use verilog.vl_types.all;
entity GMUX2ND1BWP is
    port(
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        S               : in     vl_logic;
        ZN              : out    vl_logic
    );
end GMUX2ND1BWP;
