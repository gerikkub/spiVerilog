set_property SRC_FILE_INFO {cfile:C:/Users/Gerik/Documents/sha-256/sha-256.srcs/constrs_1/new/arty.xdc rfile:../../../sha-256.srcs/constrs_1/new/arty.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports CLK100MHZ]
set_property src_info {type:XDC file:1 line:115 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports sclk]
set_property src_info {type:XDC file:1 line:116 export:INPUT save:INPUT read:READ} [current_design]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets sclk_IBUF]
set_property src_info {type:XDC file:1 line:118 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports miso]
set_property src_info {type:XDC file:1 line:119 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports mosi]
set_property src_info {type:XDC file:1 line:120 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports cs]
set_property src_info {type:XDC file:1 line:121 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN R12 IOSTANDARD LVCMOS33} [get_ports reset]
set_property src_info {type:XDC file:1 line:233 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name {spi/ctrlUnit/ctrlState[0]} -source [get_pins slowClk_reg/Q] -divide_by 2 [get_pins {spi/ctrlUnit/FSM_sequential_ctrlState_reg[0]/Q}]
set_property src_info {type:XDC file:1 line:234 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name {spi/ctrlUnit/ctrlState[1]} -source [get_pins slowClk_reg/Q] -divide_by 4 [get_pins {spi/ctrlUnit/FSM_sequential_ctrlState_reg[1]/Q}]
set_property src_info {type:XDC file:1 line:235 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name {spi/ctrlUnit/ctrlState[2]} -source [get_pins slowClk_reg/Q] -divide_by 8 [get_pins {spi/ctrlUnit/FSM_sequential_ctrlState_reg[2]/Q}]
