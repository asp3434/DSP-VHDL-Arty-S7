## Clock
set_property PACKAGE_PIN R2 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.000 -waveform {0 5.000} [get_ports clk]

## LEDs
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports led0]
set_property -dict { PACKAGE_PIN F13 IOSTANDARD LVCMOS33 } [get_ports led1]
set_property -dict { PACKAGE_PIN E13 IOSTANDARD LVCMOS33 } [get_ports led2]
set_property -dict { PACKAGE_PIN H15 IOSTANDARD LVCMOS33 } [get_ports led3]

# RGB LEDs
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports led4_r]
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports led4_g]
set_property -dict { PACKAGE_PIN F15 IOSTANDARD LVCMOS33 } [get_ports led4_b]
set_property -dict { PACKAGE_PIN E15 IOSTANDARD LVCMOS33 } [get_ports led5_r]
set_property -dict { PACKAGE_PIN F18 IOSTANDARD LVCMOS33 } [get_ports led5_g]
set_property -dict { PACKAGE_PIN E14 IOSTANDARD LVCMOS33 } [get_ports led5_b]