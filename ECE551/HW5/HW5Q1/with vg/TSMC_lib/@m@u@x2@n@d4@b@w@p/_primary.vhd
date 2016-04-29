library verilog;
use verilog.vl_types.all;
entity MUX2ND4BWP is
    port(
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        S               : in     vl_logic;
        ZN              : out    vl_logic
    );
end MUX2ND4BWP;
