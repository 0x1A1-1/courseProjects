library verilog;
use verilog.vl_types.all;
entity BENCD2BWP is
    port(
        M0              : in     vl_logic;
        M1              : in     vl_logic;
        M2              : in     vl_logic;
        X2              : out    vl_logic;
        A               : out    vl_logic;
        S               : out    vl_logic
    );
end BENCD2BWP;
