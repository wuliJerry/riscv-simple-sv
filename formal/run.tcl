set_app_var fml_mode_on true
set_fml_appmode FPV

# Set the design name
set design riscv_singlecycle_core

read_file -top formal_wrapper -format sverilog -sva \
    -vcs { \
        ./formal_config.sv \
        ./common/constants.sv \
        ./common/adder.sv \
        ./common/alu.sv \
        ./common/alu_control.sv \
        ./common/control_transfer.sv \
        ./common/data_memory_interface.sv \
        ./common/immediate_generator.sv \
        ./common/instruction_decoder.sv \
        ./common/multiplexer.sv \
        ./common/multiplexer2.sv \
        ./common/multiplexer4.sv \
        ./common/multiplexer8.sv \
        ./common/regfile.sv \
        ./common/register.sv \
        ./singlecycle/singlecycle_control.sv \
        ./singlecycle/singlecycle_ctlpath.sv \
        ./singlecycle/singlecycle_datapath.sv \
        ./singlecycle/riscv_core.sv \
        ./singlecycle/formal_wrapper.sv \
        +define+FORMAL \
    }

# Create clock and reset
create_clock clk -period 100
create_reset reset -sense high

# Initialize the design to a stable state
sim_run -stable
sim_save_reset

# Configure proof bounds
set_fml_var fml_max_steps 30

# Configure assertions to verify
# Verify all assertions
set_fml_var fml_assert_verification_on_for true


# Run formal verification
check_fv
