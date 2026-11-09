vlog Alu_RISC.v      
vlog Memory_Unit.v      
vlog RISC_SPM.v
vlog Processing_Unit.v  
vlog test_RISC_SPM.v
vlog Control_Unit.v  
vlog Register_Unit.v
vlog mux5_1.v
vlog mux3_1.v

# Compile testbench
vlog Clock_Unit.v    
vlog test_RISC_SPM.v

vsim -novopt test_RISC_SPM 
view -undock wave
do wave.do
run 100us
