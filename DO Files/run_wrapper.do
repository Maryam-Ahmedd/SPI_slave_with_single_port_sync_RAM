vlib work
vlog spi_wrapper.v wrapper_tb.v 
vsim -voptargs=+acc work.SPI_Wrapper_tb 
add wave -position insertpoint  \
sim:/SPI_Wrapper_tb/clk \
sim:/SPI_Wrapper_tb/rst_n \
sim:/SPI_Wrapper_tb/SS_n \
sim:/SPI_Wrapper_tb/MOSI \
sim:/SPI_Wrapper_tb/MISO
add wave -position insertpoint  \
sim:/SPI_Wrapper_tb/DUT/ramBlock/rx_valid \
sim:/SPI_Wrapper_tb/DUT/ramBlock/tx_valid \
sim:/SPI_Wrapper_tb/DUT/ramBlock/mem \
sim:/SPI_Wrapper_tb/DUT/ramBlock/addr
add wave -position insertpoint  \
sim:/SPI_Wrapper_tb/DUT/spiBlock/tx_data \
sim:/SPI_Wrapper_tb/DUT/spiBlock/rx_data \
sim:/SPI_Wrapper_tb/DUT/spiBlock/out_counter \
sim:/SPI_Wrapper_tb/DUT/spiBlock/cs \
sim:/SPI_Wrapper_tb/DUT/spiBlock/ns \
sim:/SPI_Wrapper_tb/DUT/spiBlock/bit_counter
run -all
#quit -sim