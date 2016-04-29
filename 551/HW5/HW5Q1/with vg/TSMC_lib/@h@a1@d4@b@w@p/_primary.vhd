library verilog;
use verilog.vl_types.all;
entity HA1D4BWP is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        S               : out    vl_logic;
        CO              : out    vl_logic
    );
end HA1D4BWP;
