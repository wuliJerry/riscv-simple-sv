`include "formal_config.sv"
`include "constants.sv"

module adder #(
    parameter  WIDTH = 32,
    parameter  DEBUG_ENABLE = 0,
    parameter  DEBUG_NAME = "UNKNOWN",
    parameter  FORMAL_INIT_VALUE_A = 32'h00000000,
    parameter  FORMAL_INIT_VALUE_B = 32'h00000000
) (
    input  [WIDTH-1:0] operand_a,
    input  [WIDTH-1:0] operand_b,
    output [WIDTH-1:0] result,
    input  clock
);

    assign result = operand_a + operand_b;

    generate
        if (ASSERT_ENABLE) begin
            operand_a_matches_aval: assert property (
                @(posedge clock)
                (operand_a == ASSERT_AVAL) || (operand_b == ASSERT_AVAL)
            ) else $error("Adder %s: Neither operand matches ASSERT_AVAL", DEBUG_NAME);

            operand_b_matches_bval: assert property (
                @(posedge clock)
                (operand_a == ASSERT_BVAL) || (operand_b == ASSERT_BVAL)
            ) else $error("Adder %s: Neither operand matches ASSERT_BVAL", DEBUG_NAME);
        end
    endgenerate

endmodue