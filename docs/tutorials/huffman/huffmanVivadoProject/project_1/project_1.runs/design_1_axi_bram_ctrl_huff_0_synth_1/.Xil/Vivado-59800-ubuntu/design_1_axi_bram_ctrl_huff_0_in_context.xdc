create_clock -period 10.000 [get_ports -no_traverse bram_clk_a]
set_property -quiet CLOCK_PERIOD_OOC_TARGET 10.000 [get_ports -no_traverse -quiet bram_clk_a]
set_property -quiet CLOCK_PERIOD_OOC_TARGET 10.000 [get_ports -no_traverse -quiet s_axi_aclk]
set_property -quiet IS_IP_OOC_CELL TRUE [get_cells -of [get_ports -no_traverse -quiet bram_addr_a[0]]]
