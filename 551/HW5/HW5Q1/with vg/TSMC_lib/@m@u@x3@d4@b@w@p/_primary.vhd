library verilog;
use verilog.vl_types.all;
entity MUX3D4BWP is
    port(
        I0              : in     vl_logic;
        I1              : in     vl_logic;
        I2              : in     vl_logic;
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        Z               : out    vl_logic
    );
end MUX3D4BWP;
