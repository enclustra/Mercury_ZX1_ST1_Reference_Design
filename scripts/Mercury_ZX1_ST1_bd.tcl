# ----------------------------------------------------------------------------------------------------
# Copyright (c) 2025 by Enclustra GmbH, Switzerland.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this hardware, software, firmware, and associated documentation files (the
# "Product"), to deal in the Product without restriction, including without
# limitation the rights to use, copy, modify, merge, publish, distribute,
# sublicense, and/or sell copies of the Product, and to permit persons to whom the
# Product is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Product.
#
# THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
# ----------------------------------------------------------------------------------------------------

create_bd_design $module


create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7 processing_system7
set_property -dict [ list \
  CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
  CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} \
  CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 2.5V} \
  CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 2.5V} \
  CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
  CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
  CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
  CONFIG.PCW_SD0_GRP_CD_IO {MIO 50} \
  CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {1} \
  CONFIG.PCW_I2C0_I2C0_IO {EMIO} \
  CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
  CONFIG.PCW_UART0_UART0_IO {MIO 46 .. 47} \
  CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {1} \
  CONFIG.PCW_WDT_PERIPHERAL_ENABLE {1} \
  CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
  CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
  CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
  CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
  CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
  CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
  CONFIG.PCW_EN_CLK1_PORT {1} \
  CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {50} \
  CONFIG.PCW_EN_CLK2_PORT {1} \
  CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {25} \
  CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
  CONFIG.PCW_ENET_RESET_ENABLE {0} \
  CONFIG.PCW_USB_RESET_ENABLE {0} \
  CONFIG.PCW_I2C_RESET_ENABLE {0} \
] [get_bd_cells processing_system7]

create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset ps_sys_rst

if { $CPU_FREQ == "1I"} {
  set_property -dict [ list \
    CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {667} \
  ] [get_bd_cells processing_system7]
}

if { $CPU_FREQ == "2I"} {
  set_property -dict [ list \
    CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {800} \
  ] [get_bd_cells processing_system7]
}
set_property -dict [ list \
  CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {-0.032} \
  CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.043} \
  CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.061} \
  CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.285} \
  CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.272} \
  CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.255} \
  CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.243} \
  CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3} \
  CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125} \
  CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
  CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
] [get_bd_cells processing_system7]

create_bd_cell -type ip -vlnv xilinx.com:ip:xadc_wiz xadc_wiz
set_property -dict [ list \
  CONFIG.TEMPERATURE_ALARM_OT_TRIGGER {85} \
  CONFIG.CHANNEL_ENABLE_VP_VN {false} \
] [get_bd_cells xadc_wiz]
set_property -dict [ list \
  CONFIG.PCW_MIO_16_SLEW {fast} \
  CONFIG.PCW_MIO_17_SLEW {fast} \
  CONFIG.PCW_MIO_18_SLEW {fast} \
  CONFIG.PCW_MIO_19_SLEW {fast} \
  CONFIG.PCW_MIO_20_SLEW {fast} \
  CONFIG.PCW_MIO_21_SLEW {fast} \
  CONFIG.PCW_MIO_22_SLEW {fast} \
  CONFIG.PCW_MIO_23_SLEW {fast} \
  CONFIG.PCW_MIO_24_SLEW {fast} \
  CONFIG.PCW_MIO_25_SLEW {fast} \
  CONFIG.PCW_MIO_26_SLEW {fast} \
  CONFIG.PCW_MIO_27_SLEW {fast} \
  CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
  CONFIG.PCW_IRQ_F2P_INTR {1} \
] [get_bd_cells processing_system7]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat interrupts
set_property -dict [ list \
  CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {1} \
  CONFIG.PCW_I2C1_I2C1_IO {EMIO} \
] [get_bd_cells processing_system7]
set_property -dict [ list \
  CONFIG.NUM_PORTS {2} \
] [get_bd_cells interrupts]
set_property -dict [ list \
  CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {15} \
] [get_bd_cells processing_system7]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio led
set_property -dict [ list \
  CONFIG.C_GPIO_WIDTH {2} \
  CONFIG.C_ALL_OUTPUTS {1} \
  CONFIG.C_DOUT_DEFAULT {0x0000003} \
] [get_bd_cells led]

create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series SDRAM

create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset mem_sys_rst

if { $PL_DDR == "30-2I-D10"} {
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name [get_bd_cells SDRAM] ] ] ]
  set str_mig_file_name mig_30.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}
  file copy ./src/$str_mig_file_name $str_mig_file_path
}

if { $PL_DDR == "30-2I-D10"} {
  set_property -dict [ list \
    CONFIG.BOARD_MIG_PARAM {Custom} \
    CONFIG.MIG_DONT_TOUCH_PARAM {Custom} \
    CONFIG.RESET_BOARD_INTERFACE {Custom} \
    CONFIG.XML_INPUT_FILE {mig_30.prj} \
  ] [get_bd_cells SDRAM]
}

if { $PL_DDR == "35-1I-D10"} {
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name [get_bd_cells SDRAM] ] ] ]
  set str_mig_file_name mig_35.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}
  file copy ./src/$str_mig_file_name $str_mig_file_path
}

if { $PL_DDR == "35-1I-D10"} {
  set_property -dict [ list \
    CONFIG.BOARD_MIG_PARAM {Custom} \
    CONFIG.MIG_DONT_TOUCH_PARAM {Custom} \
    CONFIG.RESET_BOARD_INTERFACE {Custom} \
    CONFIG.XML_INPUT_FILE {mig_35.prj} \
  ] [get_bd_cells SDRAM]
}

if { $PL_DDR == "45-2I-D10"} {
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name [get_bd_cells SDRAM] ] ] ]
  set str_mig_file_name mig_45.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}
  file copy ./src/$str_mig_file_name $str_mig_file_path
}

if { $PL_DDR == "45-2I-D10"} {
  set_property -dict [ list \
    CONFIG.BOARD_MIG_PARAM {Custom} \
    CONFIG.MIG_DONT_TOUCH_PARAM {Custom} \
    CONFIG.RESET_BOARD_INTERFACE {Custom} \
    CONFIG.XML_INPUT_FILE {mig_45.prj} \
  ] [get_bd_cells SDRAM]
}
set_property -dict [ list \
  CONFIG.PCW_USE_M_AXI_GP1 {1} \
] [get_bd_cells processing_system7]
set_property -dict [ list \
  CONFIG.ENABLE_TEMP_BUS {true} \
] [get_bd_cells xadc_wiz]

create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartconnect_ddr
set_property -dict [ list \
  CONFIG.NUM_SI {1} \
] [get_bd_cells smartconnect_ddr]
set_property -dict [ list \
  CONFIG.NUM_PORTS {3} \
] [get_bd_cells interrupts]

connect_bd_net [get_bd_pins ps_sys_rst/slowest_sync_clk] [get_bd_pins processing_system7/FCLK_CLK0]
connect_bd_net [get_bd_pins ps_sys_rst/ext_reset_in] [get_bd_pins processing_system7/FCLK_RESET0_N]
set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
connect_bd_intf_net [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7/FIXED_IO]
set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
connect_bd_intf_net [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7/DDR]
connect_bd_net [get_bd_pins interrupts/dout] [get_bd_pins processing_system7/IRQ_F2P]
connect_bd_net [get_bd_pins xadc_wiz/ip2intc_irpt] [get_bd_pins interrupts/In1]
set IIC_FPGA [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC_FPGA ]
connect_bd_intf_net [get_bd_intf_ports IIC_FPGA] [get_bd_intf_pins processing_system7/IIC_1]
set IIC [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC ]
connect_bd_intf_net [get_bd_intf_ports IIC] [get_bd_intf_pins processing_system7/IIC_0]
connect_bd_net [get_bd_pins processing_system7/FCLK_CLK0] [get_bd_pins processing_system7/M_AXI_GP0_ACLK]
set DDR3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR3 ]
connect_bd_intf_net [get_bd_intf_ports DDR3] [get_bd_intf_pins SDRAM/DDR3]
set SYS_CLK [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SYS_CLK ]
connect_bd_intf_net [get_bd_intf_ports SYS_CLK] [get_bd_intf_pins SDRAM/SYS_CLK]
connect_bd_net [get_bd_pins SDRAM/ui_clk] [get_bd_pins mem_sys_rst/slowest_sync_clk]
connect_bd_net [get_bd_pins SDRAM/mmcm_locked] [get_bd_pins mem_sys_rst/dcm_locked]
connect_bd_net [get_bd_pins mem_sys_rst/ext_reset_in] [get_bd_pins SDRAM/ui_clk_sync_rst]
connect_bd_net [get_bd_pins SDRAM/sys_rst] [get_bd_pins processing_system7/FCLK_RESET0_N]
connect_bd_net [get_bd_pins SDRAM/device_temp_i] [get_bd_pins xadc_wiz/temp_out]
connect_bd_net [get_bd_pins SDRAM/aresetn] [get_bd_pins mem_sys_rst/peripheral_aresetn]
connect_bd_intf_net [get_bd_intf_pins smartconnect_ddr/M00_AXI] [get_bd_intf_pins SDRAM/S_AXI]
connect_bd_intf_net [get_bd_intf_pins smartconnect_ddr/S00_AXI] [get_bd_intf_pins processing_system7/M_AXI_GP1]
connect_bd_net [get_bd_pins smartconnect_ddr/aclk] [get_bd_pins SDRAM/ui_clk]
connect_bd_net [get_bd_pins smartconnect_ddr/aresetn] [get_bd_pins mem_sys_rst/peripheral_aresetn]
connect_bd_net [get_bd_pins processing_system7/M_AXI_GP1_ACLK] [get_bd_pins SDRAM/ui_clk]

create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartconnect_00
set_property -dict [list CONFIG.NUM_MI {2} CONFIG.NUM_CLKS {1} CONFIG.NUM_SI {1}] [get_bd_cells smartconnect_00]
connect_bd_intf_net [get_bd_intf_pins processing_system7/M_AXI_GP0] [get_bd_intf_pins smartconnect_00/S00_AXI]
connect_bd_net [get_bd_pins processing_system7/FCLK_CLK0] [get_bd_pins smartconnect_00/aclk]
connect_bd_net [get_bd_pins ps_sys_rst/interconnect_aresetn] [get_bd_pins smartconnect_00/aresetn]
connect_bd_intf_net [get_bd_intf_pins smartconnect_00/M00_AXI ] [get_bd_intf_pins xadc_wiz/S_AXI_LITE]
connect_bd_intf_net [get_bd_intf_pins smartconnect_00/M01_AXI ] [get_bd_intf_pins led/S_AXI]

connect_bd_net [get_bd_pins ps_sys_rst/peripheral_aresetn] [get_bd_pins xadc_wiz/s_axi_aresetn]
connect_bd_net [get_bd_pins processing_system7/FCLK_CLK0] [get_bd_pins xadc_wiz/s_axi_aclk]
connect_bd_net [get_bd_pins ps_sys_rst/peripheral_aresetn] [get_bd_pins led/s_axi_aresetn]
connect_bd_net [get_bd_pins processing_system7/FCLK_CLK0] [get_bd_pins led/s_axi_aclk]

set Clk100 [ create_bd_port -dir O -type clk Clk100]
connect_bd_net [get_bd_ports Clk100] [get_bd_pins processing_system7/FCLK_CLK0]
set Clk50 [ create_bd_port -dir O -type clk Clk50]
connect_bd_net [get_bd_ports Clk50] [get_bd_pins processing_system7/FCLK_CLK1]
set Clk25 [ create_bd_port -dir O -type clk Clk25]
connect_bd_net [get_bd_ports Clk25] [get_bd_pins processing_system7/FCLK_CLK2]
set Rst_N [ create_bd_port -dir O -type rst Rst_N]
connect_bd_net [get_bd_ports Rst_N] [get_bd_pins processing_system7/FCLK_RESET0_N]
set IRQ_I2C [ create_bd_port -dir I -type intr IRQ_I2C]
connect_bd_net [get_bd_ports IRQ_I2C] [get_bd_pins interrupts/In0]
set LED_N [ create_bd_port -dir O -from 1 -to 0 LED_N]
connect_bd_net [get_bd_ports LED_N] [get_bd_pins led/gpio_io_o]
set IRQ_ETH0 [ create_bd_port -dir I -type intr IRQ_ETH0]
connect_bd_net [get_bd_ports IRQ_ETH0] [get_bd_pins interrupts/In2]
assign_bd_address
save_bd_design
validate_bd_design
save_bd_design
