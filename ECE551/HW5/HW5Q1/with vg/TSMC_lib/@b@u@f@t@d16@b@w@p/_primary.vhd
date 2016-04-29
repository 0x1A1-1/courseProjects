library verilog;
use verilog.vl_types.all;
entity BUFTD16BWP is
    port(
        I               : in     vl_logic;
        OE              : in     vl_logic;
        Z               : out    vl_logic
    );
end BUFTD16BWP;
