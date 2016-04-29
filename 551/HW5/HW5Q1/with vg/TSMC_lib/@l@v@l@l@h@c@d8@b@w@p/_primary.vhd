library verilog;
use verilog.vl_types.all;
entity LVLLHCD8BWP is
    port(
        I               : in     vl_logic;
        NSLEEP          : in     vl_logic;
        Z               : out    vl_logic
    );
end LVLLHCD8BWP;
