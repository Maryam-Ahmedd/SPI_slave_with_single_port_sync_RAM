create_project SPI_project_1 D:/digital\diploma/projects/SPI_slave_with_single_port_sync_RAM/SPI_slave_with_single_port_sync_RAM/spi -part xc7a35ticpg236-1L -force

add_files spi_wrapper.v
add_files ram.v
add_files spi_slave.v
add_files Constraints_basys3.xdc

reset_run synth_1

synth_design -rtl -top spi_wrapper > elab.log

write_schematic elaboration_shcematic.pdf -format pdf -force

launch_runs synth_1 > synth.log

wait_on_run synth_1
open_run synth_1

write_schematic synthesized_shcematic.pdf -format pdf -force

write_verilog -force netlist.v

report_utilization -name utilization_1

report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -routable_nets -name synthesis_timing_report

launch_runs impl_1 -to_step write_bitstream -jobs 4

wait_on_run impl_1
open_run impl_1

open_hw

connect_hw_server