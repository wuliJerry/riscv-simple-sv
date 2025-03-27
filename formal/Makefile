# formal/Makefile
.PHONY: all clean singlecycle prepare

all: singlecycle

prepare:
	@mkdir -p ./common
	@mkdir -p ./singlecycle
	@cp ../core/common/constants.sv ./common/
	@cp ../core/common/alu.sv ./common/
	@cp ../core/common/alu_control.sv ./common/
	@cp ../core/common/control_transfer.sv ./common/
	@cp ../core/common/data_memory_interface.sv ./common/
	@cp ../core/common/immediate_generator.sv ./common/
	@cp ../core/common/instruction_decoder.sv ./common/
	@cp ../core/common/multiplexer.sv ./common/
	@cp ../core/common/multiplexer2.sv ./common/
	@cp ../core/common/multiplexer4.sv ./common/
	@cp ../core/common/multiplexer8.sv ./common/
	@cp ../core/common/regfile.sv ./common/
	@cp ../core/common/register.sv ./common/
	@cp ../core/singlecycle/singlecycle_control.sv ./singlecycle/
	@cp ../core/singlecycle/singlecycle_ctlpath.sv ./singlecycle/
	@cp ../core/singlecycle/riscv_core.sv ./singlecycle/

singlecycle: prepare
	sby -d output -f singlecycle.sby

clean:
	rm -rf output
