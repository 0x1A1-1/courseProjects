library verilog;
use verilog.vl_types.all;
entity FCICOND2BWP is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        CI              : in     vl_logic;
        CON             : out    vl_logic
    );
end FCICOND2BWP;
