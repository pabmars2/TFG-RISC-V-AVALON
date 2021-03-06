# TCL File Generated by Component Editor 17.1
# Wed Jun 02 16:54:22 CEST 2021
# DO NOT MODIFY


# 
# AvalonMasterUART "AvalonMasterUART" v4.6
#  2021.06.02.16:54:22
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module AvalonMasterUART
# 
set_module_property DESCRIPTION ""
set_module_property NAME AvalonMasterUART
set_module_property VERSION 4.6
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP myAvalonIPs
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME AvalonMasterUART
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_UART
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file avalon_UART.sv SYSTEM_VERILOG PATH avalon_UART.sv TOP_LEVEL_FILE
add_fileset_file UART.sv SYSTEM_VERILOG PATH UART.sv
add_fileset_file avalon_mm_master.sv SYSTEM_VERILOG PATH avalon_mm_master.sv
add_fileset_file uart_rx.sv SYSTEM_VERILOG PATH uart_rx.sv
add_fileset_file uart_tx.sv SYSTEM_VERILOG PATH uart_tx.sv

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL avalon_UART
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file avalon_UART.sv SYSTEM_VERILOG PATH avalon_UART.sv
add_fileset_file UART.sv SYSTEM_VERILOG PATH UART.sv
add_fileset_file avalon_mm_master.sv SYSTEM_VERILOG PATH avalon_mm_master.sv
add_fileset_file uart_rx.sv SYSTEM_VERILOG PATH uart_rx.sv
add_fileset_file uart_tx.sv SYSTEM_VERILOG PATH uart_tx.sv


# 
# parameters
# 
add_parameter c_CLKS_PER_BIT INTEGER 434 ""
set_parameter_property c_CLKS_PER_BIT DEFAULT_VALUE 434
set_parameter_property c_CLKS_PER_BIT DISPLAY_NAME c_CLKS_PER_BIT
set_parameter_property c_CLKS_PER_BIT WIDTH ""
set_parameter_property c_CLKS_PER_BIT TYPE INTEGER
set_parameter_property c_CLKS_PER_BIT UNITS None
set_parameter_property c_CLKS_PER_BIT ALLOWED_RANGES -2147483648:2147483647
set_parameter_property c_CLKS_PER_BIT DESCRIPTION ""
set_parameter_property c_CLKS_PER_BIT HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 50000000
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock CLK clk Input 1


# 
# connection point avalon_master
# 
add_interface avalon_master avalon start
set_interface_property avalon_master addressUnits SYMBOLS
set_interface_property avalon_master associatedClock clock
set_interface_property avalon_master associatedReset reset
set_interface_property avalon_master bitsPerSymbol 8
set_interface_property avalon_master burstOnBurstBoundariesOnly false
set_interface_property avalon_master burstcountUnits WORDS
set_interface_property avalon_master doStreamReads false
set_interface_property avalon_master doStreamWrites false
set_interface_property avalon_master holdTime 0
set_interface_property avalon_master linewrapBursts false
set_interface_property avalon_master maximumPendingReadTransactions 0
set_interface_property avalon_master maximumPendingWriteTransactions 0
set_interface_property avalon_master readLatency 0
set_interface_property avalon_master readWaitTime 1
set_interface_property avalon_master setupTime 0
set_interface_property avalon_master timingUnits Cycles
set_interface_property avalon_master writeWaitTime 0
set_interface_property avalon_master ENABLED true
set_interface_property avalon_master EXPORT_OF ""
set_interface_property avalon_master PORT_NAME_MAP ""
set_interface_property avalon_master CMSIS_SVD_VARIABLES ""
set_interface_property avalon_master SVD_ADDRESS_GROUP ""

add_interface_port avalon_master READDATA readdata Input 32
add_interface_port avalon_master WAITREQUEST waitrequest Input 1
add_interface_port avalon_master ADDRESS address Output 32
add_interface_port avalon_master WRITEDATA writedata Output 32
add_interface_port avalon_master BEGINTRANSFER flush Output 1
add_interface_port avalon_master READ read Output 1
add_interface_port avalon_master WRITE write Output 1
add_interface_port avalon_master LOCK lock Output 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset RST reset Input 1


# 
# connection point control
# 
add_interface control conduit end
set_interface_property control associatedClock clock
set_interface_property control associatedReset reset
set_interface_property control ENABLED true
set_interface_property control EXPORT_OF ""
set_interface_property control PORT_NAME_MAP ""
set_interface_property control CMSIS_SVD_VARIABLES ""
set_interface_property control SVD_ADDRESS_GROUP ""

add_interface_port control flag_tx flag_tx Input 1


# 
# connection point rs232_tx
# 
add_interface rs232_tx conduit end
set_interface_property rs232_tx associatedClock clock
set_interface_property rs232_tx associatedReset reset
set_interface_property rs232_tx ENABLED true
set_interface_property rs232_tx EXPORT_OF ""
set_interface_property rs232_tx PORT_NAME_MAP ""
set_interface_property rs232_tx CMSIS_SVD_VARIABLES ""
set_interface_property rs232_tx SVD_ADDRESS_GROUP ""

add_interface_port rs232_tx TX tx Output 1


# 
# connection point rs232_rx
# 
add_interface rs232_rx conduit end
set_interface_property rs232_rx associatedClock clock
set_interface_property rs232_rx associatedReset reset
set_interface_property rs232_rx ENABLED true
set_interface_property rs232_rx EXPORT_OF ""
set_interface_property rs232_rx PORT_NAME_MAP ""
set_interface_property rs232_rx CMSIS_SVD_VARIABLES ""
set_interface_property rs232_rx SVD_ADDRESS_GROUP ""

add_interface_port rs232_rx RX rx Input 1


# 
# connection point DoneSending
# 
add_interface DoneSending conduit end
set_interface_property DoneSending associatedClock clock
set_interface_property DoneSending associatedReset reset
set_interface_property DoneSending ENABLED true
set_interface_property DoneSending EXPORT_OF ""
set_interface_property DoneSending PORT_NAME_MAP ""
set_interface_property DoneSending CMSIS_SVD_VARIABLES ""
set_interface_property DoneSending SVD_ADDRESS_GROUP ""

add_interface_port DoneSending doneSending donesending Output 1

