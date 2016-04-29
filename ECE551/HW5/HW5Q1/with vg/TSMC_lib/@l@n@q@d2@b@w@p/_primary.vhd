library verilog;
use verilog.vl_types.all;
entity LNQD2BWP is
    port(
        D               : in     vl_logic;
        EN              : in     vl_logic;
        Q               : out    vl_logic
    );
end LNQD2BWP;
