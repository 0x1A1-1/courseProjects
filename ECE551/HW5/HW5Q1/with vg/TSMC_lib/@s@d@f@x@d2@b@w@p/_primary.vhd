library verilog;
use verilog.vl_types.all;
entity SDFXD2BWP is
    port(
        DA              : in     vl_logic;
        DB              : in     vl_logic;
        SA              : in     vl_logic;
        SI              : in     vl_logic;
        SE              : in     vl_logic;
        CP              : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end SDFXD2BWP;
