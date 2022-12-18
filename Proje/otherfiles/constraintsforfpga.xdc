# Constraints for uart_fpga

# Clock pin assignment
create_clock -name CLK -period 10 -waveform {0 5} [get_ports clk]

# Input pin assignments
set_input_delay -clock CLK 0 [get_ports {data_in1 data_in2 rst rx state}]

# Output pin assignments
set_output_delay -clock CLK 5 [get_ports {data_out tx}]

# Physical pin assignments
set_location_assignment PIN_NAME -to [get_ports clk]
set_location_assignment PIN_NAME -to [get_ports rst]
set_location_assignment PIN_NAME -to [get_ports state]
set_location_assignment PIN_NAME -to [get_ports data_in1]
set_location_assignment PIN_NAME -to [get_ports data_in2]
set_location_assignment PIN_NAME -to [get_ports data_out]
set_location_assignment PIN_NAME -to [get_ports tx]
set_location_assignment PIN_NAME -to [get_ports rx]