# See LICENSE for license details.

#*****************************************************************************
# mixed_comp.S
#-----------------------------------------------------------------------------
#
# Test a mix of rv32i instructions performing a simple computation
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Basic computation test - sum numbers from 1 to 10
  #-------------------------------------------------------------

  # Initialize registers
  li x1, 0      # Sum
  li x2, 1      # Counter
  li x3, 11     # Limit (loop until counter = 11)

loop:
  add x1, x1, x2    # Add counter to sum
  addi x2, x2, 1    # Increment counter
  blt x2, x3, loop  # Branch if counter < limit

  # Expected result: sum = 55 (1+2+3+4+5+6+7+8+9+10)
  
  # Store the result to memory
  la x4, result
  sw x1, 0(x4)
  
  # Load it back
  lw x5, 0(x4)
  
  # Do some operations with the result
  li x6, 100
  sub x7, x6, x5    # 100 - 55 = 45
  xori x8, x7, 15   # 45 ^ 15 = 34
  and x9, x8, x7    # 34 & 45 = 32
  or x10, x9, x5    # 32 | 55 = 55
  slli x11, x10, 1  # 55 << 1 = 110
  srli x12, x11, 2  # 110 >> 2 = 27
  
  # Check final result against expected value
  li x13, 27
  bne x12, x13, fail
  
  # Store at debug register to signal success
  li a0, DEBUG_REG
  li a1, 1
  sw a1, 0(a0)
  
  # Test passed, jump to pass label
  j pass

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA
  
  # Space for storing results
  .align 2
result:
  .word 0

RVTEST_DATA_END