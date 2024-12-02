# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
 
# Switches
set_property PACKAGE_PIN V17 	 [get_ports {sw[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 	 [get_ports {sw[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 	 [get_ports {sw[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 	 [get_ports {sw[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 	 [get_ports {sw[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 	 [get_ports {sw[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 	 [get_ports {sw[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13     [get_ports {sw[7]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]

set_property PACKAGE_PIN R2 	 [get_ports {reset}]					
set_property IOSTANDARD LVCMOS33 [get_ports {reset}]

##Buttons
set_property PACKAGE_PIN U18 	 [get_ports set]						
set_property IOSTANDARD LVCMOS33 [get_ports set]
set_property PACKAGE_PIN T18 	 [get_ports up]						
set_property IOSTANDARD LVCMOS33 [get_ports up]
set_property PACKAGE_PIN W19 	 [get_ports left]						
set_property IOSTANDARD LVCMOS33 [get_ports left]
set_property PACKAGE_PIN T17 	 [get_ports right]						
set_property IOSTANDARD LVCMOS33 [get_ports right]
set_property PACKAGE_PIN U17 	 [get_ports down]						
set_property IOSTANDARD LVCMOS33 [get_ports down]

#USB-RS232 Interface
set_property PACKAGE_PIN B18 [get_ports RsRx]						
set_property IOSTANDARD LVCMOS33 [get_ports RsRx]
set_property PACKAGE_PIN A18 [get_ports RsTx]						
set_property IOSTANDARD LVCMOS33 [get_ports RsTx]

##VGA Connector
set_property PACKAGE_PIN N19     [get_ports {rgb[11]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[11]}]
set_property PACKAGE_PIN J19     [get_ports {rgb[10]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[10]}]
set_property PACKAGE_PIN H19     [get_ports {rgb[9]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[9]}]
set_property PACKAGE_PIN G19     [get_ports {rgb[8]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[8]}]
set_property PACKAGE_PIN D17     [get_ports {rgb[7]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[7]}]
set_property PACKAGE_PIN G17     [get_ports {rgb[6]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[6]}]
set_property PACKAGE_PIN H17     [get_ports {rgb[5]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[5]}]
set_property PACKAGE_PIN J17     [get_ports {rgb[4]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[4]}]
set_property PACKAGE_PIN J18     [get_ports {rgb[3]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[3]}]
set_property PACKAGE_PIN K18     [get_ports {rgb[2]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[2]}]
set_property PACKAGE_PIN L18     [get_ports {rgb[1]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[1]}]
set_property PACKAGE_PIN N18     [get_ports {rgb[0]}]				
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[0]}]
set_property PACKAGE_PIN P19     [get_ports hsync]						
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property PACKAGE_PIN R19     [get_ports vsync]						
set_property IOSTANDARD LVCMOS33 [get_ports vsync]

# LED Constraints
set_property PACKAGE_PIN U16 [get_ports {LED[0]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN E19 [get_ports {LED[1]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property PACKAGE_PIN U19 [get_ports {LED[2]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN V19 [get_ports {LED[3]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property PACKAGE_PIN W18 [get_ports {LED[4]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property PACKAGE_PIN U15 [get_ports {LED[5]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property PACKAGE_PIN U14 [get_ports {LED[6]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property PACKAGE_PIN V14 [get_ports {LED[7]}] 
set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]