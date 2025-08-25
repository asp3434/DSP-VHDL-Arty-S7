## Clock
set_property PACKAGE_PIN R2 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.000 -waveform {0 5.000} [get_ports clk]

## LED
set_property PACKAGE_PIN E18 [get_ports led2]
set_property IOSTANDARD LVCMOS33 [get_ports led2]
