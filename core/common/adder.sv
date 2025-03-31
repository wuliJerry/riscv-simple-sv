// RISC-V SiMPLE SV -- adder module
// BSD 3-Clause License
// (c) 2017-2019, Arthur Matos, Marcus Vinicius Lamar, Universidade de Brasília,
//                Marek Materzok, University of Wrocław

`include "config.sv"
`include "constants.sv"

module adder #(
    parameter  WIDTH = 32,
    parameter  DEBUG_ENABLE = 0,
    parameter  DEBUG_NAME = "UNKNOWN"
) (
    input  [WIDTH-1:0] operand_a,
    input  [WIDTH-1:0] operand_b,
    output [WIDTH-1:0] result
);

    assign result = operand_a + operand_b;

    generate
        if (DEBUG_ENABLE) begin
            always @* begin
                $display("ADDER %s: operand_a=0x%b, operand_b=0x%b", 
                         DEBUG_NAME, operand_a, operand_b);
            end
        end
    endgenerate

endmodule

