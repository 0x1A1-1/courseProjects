library verilog;
use verilog.vl_types.all;
entity ISOHID2BWP is
    port(
        ISO             : in     vl_logic;
        I               : in     vl_logic;
        Z               : out    vl_logic
    );
end ISOHID2BWP;
