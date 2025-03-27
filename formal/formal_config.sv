`ifndef FORMAL_CONFIG
`define FORMAL_CONFIG

// Initial PC value
`define INITIAL_PC      32'h00400000

`define FORMAL_CLK      clock
`define FORMAL_RESET    reset
`define FORMAL_ENABLE   !reset

`define TEXT_BITS       16
`define DATA_BITS       17
`define TEXT_BEGIN      `INITIAL_PC
`define TEXT_WIDTH      2**`TEXT_BITS
`define TEXT_END        `TEXT_BEGIN + `TEXT_WIDTH - 1
`define DATA_BEGIN      32'h8000_0000
`define DATA_WIDTH      2**`DATA_BITS
`define DATA_END        `DATA_BEGIN + `DATA_WIDTH - 1

`define TEXT_HEX        ""
`define DATA_HEX        ""

`endif