## 2024.1_v1.1.3
* Add CLK_USR IOBUFDS instance to top level VHDL
* Added CFGBVS voltage constraints
* Refactor documentation
* Allow setting of a custom Vivado project directory
* Connected the XADC Wizard interrupt to the PS
* Set correct port type for interrupt pins in the block design
* Add gigabit transceivers to pinout file

## 2022.1_v1.1.2
* Doc: New document number
* Add IO/MGT pins based on variant
* Fixed temperature limits
* Doc: Corrected links due to new Xilinx website
* Doc: Adjust base_dir with subfolder "reference_design" in description
* Set SLEW to FAST for PS ethernet MIO pins
* Added I2C_SCL_FPGA, I2C_SDA_FPGA and I2C_MIPI_SEL pins to reference design
* Doc: Added voltage in I/O voltage jumpers section

## 2020.2_v1.1.1
* Doc: Fix incompatible project name suggestion including a '+'
* Doc: Refer to system instead of application for creating boot image and program flash
* Doc: Updates in troubleshoot section and workarounds
* Doc: Minor optimizations
* Doc: Improve MCT instructions

## 2020.1_v1.1.0
* Corrected bif file in release binaries
* Removed archive containing all binaries (complete*.zip) from release binaries
* Doc: Fixed out of order step-by-step Vivado/Vitis instructions
* Added Petalinux BSP to release binaries
* Versioning now includes Xilinx tool version
* Changed IOA voltage to 2.5V from previously 1.8V
* Doc: QSPI flash programming with Enclustra MCT now sets correct boot mode

## 2020.1_v1.0.0
* First release
