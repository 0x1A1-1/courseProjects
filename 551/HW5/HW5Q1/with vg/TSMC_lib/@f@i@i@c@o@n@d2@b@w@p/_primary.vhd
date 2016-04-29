library verilog;
use verilog.vl_types.all;
entity FIICOND2BWP is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        S               : out    vl_logic;
        CON0            : out    vl_logic;
        CON1            : out    vl_logic
    );
end FIICOND2BWP;
