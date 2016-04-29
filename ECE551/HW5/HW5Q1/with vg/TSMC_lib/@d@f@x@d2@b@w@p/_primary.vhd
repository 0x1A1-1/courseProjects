library verilog;
use verilog.vl_types.all;
entity DFXD2BWP is
    port(
        DA              : in     vl_logic;
        DB              : in     vl_logic;
        SA              : in     vl_logic;
        CP              : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end DFXD2BWP;
