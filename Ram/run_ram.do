vlib work
vlog ram.v ram_tb.v 
vsim -voptargs=+acc work.ram_tb 
add wave -position insertpoint  \
sim:/ram_tb/din \
sim:/ram_tb/clk \
sim:/ram_tb/rst_n \
sim:/ram_tb/rx_valid \
sim:/ram_tb/dout \
sim:/ram_tb/tx_valid
add wave -position insertpoint  \
sim:/ram_tb/dut/mem
run -all
#quit -sim