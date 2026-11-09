onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Testbench
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/rst
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/clk
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/clk
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/rst
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Sel_Bus_1_Mux
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Sel_Bus_2_Mux
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Zflag
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/instruction
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/address
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Bus_1
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/mem_word
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Load_R0
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Load_R1
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Load_R2
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Load_R3
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Load_PC
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Inc_PC
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Load_IR
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Load_Add_R
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Load_Reg_Y
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Load_Reg_Z
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/write
add wave -noupdate -divider Controller
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Load_R0
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Load_R1
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Load_R2
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Load_R3
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Load_PC
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Inc_PC
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Load_IR
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Load_Add_R
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Load_Reg_Y
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Load_Reg_Z
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/write
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Sel_Bus_1_Mux
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Sel_Bus_2_Mux
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/instruction
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Zflag
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/clk
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/rst
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/state
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/next_state
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Sel_ALU
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Sel_Bus_1
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Sel_Mem
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Sel_R0
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Sel_R1
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Sel_R2
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Sel_R3
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/Sel_PC
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/err_flag
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/opcode
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/dest
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Controller/src
add wave -noupdate -divider Processor
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/instruction
add wave -noupdate -format Literal -radix ascii /test_RISC_SPM/instr_ASCII
add wave -noupdate -format Literal /test_RISC_SPM/error
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/address
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Bus_1
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Zflag
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/mem_word
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Load_R0
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Load_R1
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Load_R2
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Load_R3
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Load_PC
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Inc_PC
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Load_IR
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Load_Add_R
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Load_Reg_Y
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Load_Reg_Z
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Sel_Bus_1_Mux
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Sel_Bus_2_Mux
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/clk
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/rst
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/R0_out
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/R1_out
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/R2_out
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/R3_out
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Y_value
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/alu_out
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/PC_count
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/Bus_2
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/alu_zero_flag
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/opcode
add wave -noupdate -divider ALU
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/ADD
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/alu_out
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/alu_zero_flag
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/AND
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/BR
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/BRZ
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/dest
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/NOP
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/NOT
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/op_size
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/opcode
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/RD
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/src
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/SUB
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/word_size
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/Processor/ALU/WR
add wave -noupdate -divider SRAM
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/SRAM/clk
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/SRAM/data_out
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/SRAM/data_in
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/SRAM/address
add wave -noupdate -format Logic -radix hexadecimal /test_RISC_SPM/RISC_SPM/SRAM/write
add wave -noupdate -format Literal -radix hexadecimal /test_RISC_SPM/RISC_SPM/SRAM/memory
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2353 ns} 0}
configure wave -namecolwidth 171
configure wave -valuecolwidth 62
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {2388 ns} {2978 ns}
bookmark add wave bookmark0 {{742 ns} {1164 ns}} 51
