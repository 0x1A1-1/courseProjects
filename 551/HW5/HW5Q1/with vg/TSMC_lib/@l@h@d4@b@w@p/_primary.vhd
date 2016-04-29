library verilog;
use verilog.vl_types.all;
entity LHD4BWP is
    port(
        D               : in     vl_logic;
        E               : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end LHD4BWP;
