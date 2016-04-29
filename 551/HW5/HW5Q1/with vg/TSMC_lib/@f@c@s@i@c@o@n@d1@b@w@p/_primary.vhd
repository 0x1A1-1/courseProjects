library verilog;
use verilog.vl_types.all;
entity FCSICOND1BWP is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        CI0             : in     vl_logic;
        CI1             : in     vl_logic;
        CS              : in     vl_logic;
        S               : out    vl_logic;
        CON0            : out    vl_logic;
        CON1            : out    vl_logic
    );
end FCSICOND1BWP;
