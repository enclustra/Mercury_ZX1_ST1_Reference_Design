---------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by Enclustra GmbH, Switzerland.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this hardware, software, firmware, and associated documentation files (the
-- "Product"), to deal in the Product without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute,
-- sublicense, and/or sell copies of the Product, and to permit persons to whom the
-- Product is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Product.
--
-- THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
-- PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- libraries
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------------------------------
-- entity declaration
---------------------------------------------------------------------------------------------------
entity Mercury_ZX1_ST1 is
  
  port (
    -- PS MIO Pins
    FIXED_IO_mio                   : inout  std_logic_vector(53 downto 0);
    FIXED_IO_ddr_vrn               : inout  std_logic;
    FIXED_IO_ddr_vrp               : inout  std_logic;
    FIXED_IO_ps_srstb              : inout  std_logic;
    FIXED_IO_ps_clk                : inout  std_logic;
    FIXED_IO_ps_porb               : inout  std_logic;
    DDR_cas_n                      : inout  std_logic;
    DDR_cke                        : inout  std_logic;
    DDR_ck_n                       : inout  std_logic;
    DDR_ck_p                       : inout  std_logic;
    DDR_cs_n                       : inout  std_logic;
    DDR_reset_n                    : inout  std_logic;
    DDR_odt                        : inout  std_logic;
    DDR_ras_n                      : inout  std_logic;
    DDR_we_n                       : inout  std_logic;
    DDR_ba                         : inout  std_logic_vector(2 downto 0);
    DDR_addr                       : inout  std_logic_vector(14 downto 0);
    DDR_dm                         : inout  std_logic_vector(3 downto 0);
    DDR_dq                         : inout  std_logic_vector(31 downto 0);
    DDR_dqs_n                      : inout  std_logic_vector(3 downto 0);
    DDR_dqs_p                      : inout  std_logic_vector(3 downto 0);
    
    -- Anios_0
    IO0_D0_P                       : inout   std_logic;
    IO0_D1_N                       : inout   std_logic;
    IO0_D2_P                       : inout   std_logic;
    IO0_D3_N                       : inout   std_logic;
    IO0_D4_P                       : inout   std_logic;
    IO0_D5_N                       : inout   std_logic;
    IO0_D6_P                       : inout   std_logic;
    IO0_D7_N                       : inout   std_logic;
    IO0_D8_P                       : inout   std_logic;
    IO0_D9_N                       : inout   std_logic;
    IO0_D10_P                      : inout   std_logic;
    IO0_D11_N                      : inout   std_logic;
    IO0_D12_P                      : inout   std_logic;
    IO0_D13_N                      : inout   std_logic;
    IO0_D14_P                      : inout   std_logic;
    IO0_D15_N                      : inout   std_logic;
    IO0_D16_P                      : inout   std_logic;
    IO0_D17_N                      : inout   std_logic;
    IO0_D18_P                      : inout   std_logic;
    IO0_D19_N                      : inout   std_logic;
    IO0_D20_P                      : inout   std_logic;
    IO0_D21_N                      : inout   std_logic;
    IO0_D22_P                      : inout   std_logic;
    IO0_D23_N                      : inout   std_logic;
    IO0_CLK1_N                     : inout   std_logic;
    IO0_CLK0_P                     : inout   std_logic;
    
    -- DP
    DP_HPD                         : in      std_logic;
    DP_AUX_IN                      : in      std_logic;
    DP_AUX_OE                      : out     std_logic;
    DP_AUX_OUT                     : out     std_logic;
    
    -- FMC
    FMC_LA02_N                     : inout   std_logic;
    FMC_LA02_P                     : inout   std_logic;
    FMC_LA03_N                     : inout   std_logic;
    FMC_LA03_P                     : inout   std_logic;
    FMC_LA04_N                     : inout   std_logic;
    FMC_LA04_P                     : inout   std_logic;
    FMC_LA05_N                     : inout   std_logic;
    FMC_LA05_P                     : inout   std_logic;
    FMC_LA06_N                     : inout   std_logic;
    FMC_LA06_P                     : inout   std_logic;
    FMC_LA07_N                     : inout   std_logic;
    FMC_LA07_P                     : inout   std_logic;
    FMC_LA08_N                     : inout   std_logic;
    FMC_LA08_P                     : inout   std_logic;
    FMC_LA09_N                     : inout   std_logic;
    FMC_LA09_P                     : inout   std_logic;
    FMC_LA10_N                     : inout   std_logic;
    FMC_LA10_P                     : inout   std_logic;
    FMC_LA11_N                     : inout   std_logic;
    FMC_LA11_P                     : inout   std_logic;
    FMC_LA12_N                     : inout   std_logic;
    FMC_LA12_P                     : inout   std_logic;
    FMC_LA13_N                     : inout   std_logic;
    FMC_LA13_P                     : inout   std_logic;
    FMC_LA14_N                     : inout   std_logic;
    FMC_LA14_P                     : inout   std_logic;
    FMC_LA15_N                     : inout   std_logic;
    FMC_LA15_P                     : inout   std_logic;
    FMC_LA16_N                     : inout   std_logic;
    FMC_LA16_P                     : inout   std_logic;
    FMC_LA19_N                     : inout   std_logic;
    FMC_LA19_P                     : inout   std_logic;
    FMC_LA20_N                     : inout   std_logic;
    FMC_LA20_P                     : inout   std_logic;
    FMC_LA21_N                     : inout   std_logic;
    FMC_LA21_P                     : inout   std_logic;
    FMC_LA22_N                     : inout   std_logic;
    FMC_LA22_P                     : inout   std_logic;
    FMC_LA23_N                     : inout   std_logic;
    FMC_LA23_P                     : inout   std_logic;
    FMC_LA24_N                     : inout   std_logic;
    FMC_LA24_P                     : inout   std_logic;
    FMC_LA25_N                     : inout   std_logic;
    FMC_LA25_P                     : inout   std_logic;
    FMC_LA26_N                     : inout   std_logic;
    FMC_LA26_P                     : inout   std_logic;
    FMC_LA27_N                     : inout   std_logic;
    FMC_LA27_P                     : inout   std_logic;
    FMC_LA28_N                     : inout   std_logic;
    FMC_LA28_P                     : inout   std_logic;
    FMC_LA29_N                     : inout   std_logic;
    FMC_LA29_P                     : inout   std_logic;
    FMC_LA30_N                     : inout   std_logic;
    FMC_LA30_P                     : inout   std_logic;
    FMC_LA31_N                     : inout   std_logic;
    FMC_LA31_P                     : inout   std_logic;
    FMC_LA32_N                     : inout   std_logic;
    FMC_LA32_P                     : inout   std_logic;
    FMC_LA33_N                     : inout   std_logic;
    FMC_LA33_P                     : inout   std_logic;
    FMC_LA00_CC_N                  : inout   std_logic;
    FMC_LA00_CC_P                  : inout   std_logic;
    FMC_LA01_CC_N                  : inout   std_logic;
    FMC_LA01_CC_P                  : inout   std_logic;
    FMC_LA17_CC_N                  : inout   std_logic;
    FMC_LA17_CC_P                  : inout   std_logic;
    FMC_LA18_CC_N                  : inout   std_logic;
    FMC_LA18_CC_P                  : inout   std_logic;
    FMC_CLK0_M2C_N                 : inout   std_logic;
    FMC_CLK0_M2C_P                 : inout   std_logic;
    FMC_CLK1_M2C_N                 : inout   std_logic;
    FMC_CLK1_M2C_P                 : inout   std_logic;
    
    -- HDMI
    HDMI_HPD                       : inout   std_logic;
    
    -- I2C_PL
    I2C_INT_N                      : in      std_logic;
    I2C_SCL_PL                     : inout   std_logic;
    I2C_SDA_PL                     : inout   std_logic;
    
    -- IO3
    IO3_D0_P                       : inout   std_logic;
    IO3_D1_N                       : inout   std_logic;
    IO3_D2_P                       : inout   std_logic;
    IO3_D3_N                       : inout   std_logic;
    IO3_D4_P                       : inout   std_logic;
    IO3_D5_N                       : inout   std_logic;
    IO3_D6_P                       : inout   std_logic;
    IO3_D7_N                       : inout   std_logic;
    
    -- IO4
    IO4_D2_P                       : inout   std_logic;
    IO4_D3_N                       : inout   std_logic;
    IO4_D4_P                       : inout   std_logic;
    IO4_D5_N                       : inout   std_logic;
    IO4_D6_P                       : inout   std_logic;
    IO4_D7_N                       : inout   std_logic;
    
    -- LED
    FPGA_LED0_N                    : out     std_logic;
    FPGA_LED1_N                    : out     std_logic;
    FPGA_LED2_N                    : out     std_logic;
    
    -- OSC_100M
    CLK_100_CAL                    : in      std_logic;
    
    -- PL_200_MHz_Oscillator
    CLK200_N                       : in      std_logic;
    CLK200_P                       : in      std_logic;
    
    -- PL_DDR3_Memory
    DDR3_VSEL                      : inout   std_logic;
    DDR3PL_WE_N                    : out     std_logic;
    DDR3PL_CAS_N                   : out     std_logic;
    DDR3PL_RAS_N                   : out     std_logic;
    DDR3PL_RST_N                   : out     std_logic;
    DDR3PL_BA                      : out     std_logic_vector(2 downto 0);
    DDR3PL_DQ                      : inout   std_logic_vector(15 downto 0);
    DDR3PL_A                       : out     std_logic_vector(13 downto 0);
    DDR3PL_CKE                     : out     std_logic_vector(0 downto 0);
    DDR3PL_CK_N                    : out     std_logic_vector(0 downto 0);
    DDR3PL_CK_P                    : out     std_logic_vector(0 downto 0);
    DDR3PL_ODT                     : out     std_logic_vector(0 downto 0);
    DDR3PL_DM                      : inout   std_logic_vector(1 downto 0);
    DDR3PL_DQS_N                   : inout   std_logic_vector(1 downto 0);
    DDR3PL_DQS_P                   : inout   std_logic_vector(1 downto 0);
    
    -- PL_Fast_Ethernet_1
    ETH1_CLK                       : out     std_logic;
    ETH1_MDC                       : out     std_logic;
    ETH1_MDIO                      : inout   std_logic;
    ETH1_RESET_N                   : out     std_logic;
    ETH1_INT_N_PWDN_N              : inout   std_logic;
    
    -- PL_Fast_Ethernet_1A
    ETH1A_COL_PL                   : in      std_logic;
    ETH1A_RXDV                     : in      std_logic;
    ETH1A_RXER                     : in      std_logic;
    ETH1A_TXEN                     : out     std_logic;
    ETH1A_RXCLK                    : in      std_logic;
    ETH1A_TXCLK                    : in      std_logic;
    ETH1A_CRS_PL                   : in      std_logic;
    ETH1A_LED_PL_N                 : in      std_logic;
    ETH1A_RXD                      : in      std_logic_vector(3 downto 0);
    ETH1A_TXD                      : out     std_logic_vector(3 downto 0);
    
    -- PL_Fast_Ethernet_1B
    ETH1B_COL_PL                   : in      std_logic;
    ETH1B_RXDV                     : in      std_logic;
    ETH1B_RXER                     : in      std_logic;
    ETH1B_TXEN                     : out     std_logic;
    ETH1B_RXCLK                    : in      std_logic;
    ETH1B_TXCLK                    : in      std_logic;
    ETH1B_CRS_PL                   : in      std_logic;
    ETH1B_LED_PL_N                 : in      std_logic;
    ETH1B_RXD                      : in      std_logic_vector(3 downto 0);
    ETH1B_TXD                      : out     std_logic_vector(3 downto 0);
    
    -- PL_Gig_Ethernet
    ETH0_INT_N_PL                  : in      std_logic
  );
end Mercury_ZX1_ST1;

architecture rtl of Mercury_ZX1_ST1 is

  ---------------------------------------------------------------------------------------------------
  -- component declarations
  ---------------------------------------------------------------------------------------------------
  component Mercury_ZX1 is
    port (
      Clk100              : out    std_logic;
      Clk50               : out    std_logic;
      Clk25               : out    std_logic;
      Rst_N               : out    std_logic;
      IRQ0                : in     std_logic;
      IRQ1                : in     std_logic;
      FIXED_IO_mio        : inout  std_logic_vector(53 downto 0);
      FIXED_IO_ddr_vrn    : inout  std_logic;
      FIXED_IO_ddr_vrp    : inout  std_logic;
      FIXED_IO_ps_srstb   : inout  std_logic;
      FIXED_IO_ps_clk     : inout  std_logic;
      FIXED_IO_ps_porb    : inout  std_logic;
      DDR_cas_n           : inout  std_logic;
      DDR_cke             : inout  std_logic;
      DDR_ck_n            : inout  std_logic;
      DDR_ck_p            : inout  std_logic;
      DDR_cs_n            : inout  std_logic;
      DDR_reset_n         : inout  std_logic;
      DDR_odt             : inout  std_logic;
      DDR_ras_n           : inout  std_logic;
      DDR_we_n            : inout  std_logic;
      DDR_ba              : inout  std_logic_vector(2 downto 0);
      DDR_addr            : inout  std_logic_vector(14 downto 0);
      DDR_dm              : inout  std_logic_vector(3 downto 0);
      DDR_dq              : inout  std_logic_vector(31 downto 0);
      DDR_dqs_n           : inout  std_logic_vector(3 downto 0);
      DDR_dqs_p           : inout  std_logic_vector(3 downto 0);
      IIC_sda_i           : in     std_logic;
      IIC_sda_o           : out    std_logic;
      IIC_sda_t           : out    std_logic;
      IIC_scl_i           : in     std_logic;
      IIC_scl_o           : out    std_logic;
      IIC_scl_t           : out    std_logic;
      LED_N               : out    std_logic_vector(1 downto 0);
      SYS_CLK_clk_p       : in     std_logic;
      SYS_CLK_clk_n       : in     std_logic;
      DDR3_dq             : inout  std_logic_vector(15 downto 0);
      DDR3_dqs_p          : inout  std_logic_vector(1 downto 0);
      DDR3_dqs_n          : inout  std_logic_vector(1 downto 0);
      DDR3_addr           : out    std_logic_vector(13 downto 0);
      DDR3_ba             : out    std_logic_vector(2 downto 0);
      DDR3_ras_n          : out    std_logic;
      DDR3_cas_n          : out    std_logic;
      DDR3_we_n           : out    std_logic;
      DDR3_reset_n        : out    std_logic;
      DDR3_ck_p           : out    std_logic_vector(0 downto 0);
      DDR3_ck_n           : out    std_logic_vector(0 downto 0);
      DDR3_cke            : out    std_logic_vector(0 downto 0);
      DDR3_dm             : out    std_logic_vector(1 downto 0);
      DDR3_odt            : out    std_logic_vector(0 downto 0)
    );
    
  end component Mercury_ZX1;

  ---------------------------------------------------------------------------------------------------
  -- signal declarations
  ---------------------------------------------------------------------------------------------------
  signal Clk100           : std_logic;
  signal Clk50            : std_logic;
  signal Clk25            : std_logic;
  signal Rst_N            : std_logic;
  signal IRQ0             : std_logic;
  signal IRQ1             : std_logic;
  signal IIC_sda_i        : std_logic;
  signal IIC_sda_o        : std_logic;
  signal IIC_sda_t        : std_logic;
  signal IIC_scl_i        : std_logic;
  signal IIC_scl_o        : std_logic;
  signal IIC_scl_t        : std_logic;
  signal LED_N            : std_logic_vector(1 downto 0);
  signal LedCount         : unsigned(23 downto 0);

begin
  
  ---------------------------------------------------------------------------------------------------
  -- processor system instance
  ---------------------------------------------------------------------------------------------------
  Mercury_ZX1_i: component Mercury_ZX1
    port map (
      Clk100               => Clk100,
      Clk50                => Clk50,
      Clk25                => Clk25,
      Rst_N                => Rst_N,
      IRQ0                 => IRQ0,
      IRQ1                 => IRQ1,
      FIXED_IO_mio         => FIXED_IO_mio,
      FIXED_IO_ddr_vrn     => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp     => FIXED_IO_ddr_vrp,
      FIXED_IO_ps_srstb    => FIXED_IO_ps_srstb,
      FIXED_IO_ps_clk      => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb     => FIXED_IO_ps_porb,
      DDR_cas_n            => DDR_cas_n,
      DDR_cke              => DDR_cke,
      DDR_ck_n             => DDR_ck_n,
      DDR_ck_p             => DDR_ck_p,
      DDR_cs_n             => DDR_cs_n,
      DDR_reset_n          => DDR_reset_n,
      DDR_odt              => DDR_odt,
      DDR_ras_n            => DDR_ras_n,
      DDR_we_n             => DDR_we_n,
      DDR_ba               => DDR_ba,
      DDR_addr             => DDR_addr,
      DDR_dm               => DDR_dm,
      DDR_dq               => DDR_dq,
      DDR_dqs_n            => DDR_dqs_n,
      DDR_dqs_p            => DDR_dqs_p,
      IIC_sda_i            => IIC_sda_i,
      IIC_sda_o            => IIC_sda_o,
      IIC_sda_t            => IIC_sda_t,
      IIC_scl_i            => IIC_scl_i,
      IIC_scl_o            => IIC_scl_o,
      IIC_scl_t            => IIC_scl_t,
      LED_N                => LED_N,
      SYS_CLK_clk_p        => CLK200_P,
      SYS_CLK_clk_n        => CLK200_N,
      DDR3_dq              => DDR3PL_DQ,
      DDR3_dqs_p           => DDR3PL_DQS_P,
      DDR3_dqs_n           => DDR3PL_DQS_N,
      DDR3_addr            => DDR3PL_A,
      DDR3_ba              => DDR3PL_BA,
      DDR3_ras_n           => DDR3PL_RAS_N,
      DDR3_cas_n           => DDR3PL_CAS_N,
      DDR3_we_n            => DDR3PL_WE_N,
      DDR3_reset_n         => DDR3PL_RST_N,
      DDR3_ck_p            => DDR3PL_CK_P,
      DDR3_ck_n            => DDR3PL_CK_N,
      DDR3_cke             => DDR3PL_CKE,
      DDR3_dm              => DDR3PL_DM,
      DDR3_odt             => DDR3PL_ODT
    );
  
  I2C_SDA_PL <= IIC_sda_o when IIC_sda_t = '0' else 'Z';
  IIC_sda_i <= I2C_SDA_PL;
  I2C_SCL_PL <= IIC_scl_o when IIC_scl_t = '0' else 'Z';
  IIC_scl_i <= I2C_SCL_PL;
  IRQ0 <= not I2C_INT_N;
  process (Clk50)
  begin
    if rising_edge (Clk50) then
      if Rst_N = '0' then
        LedCount    <= (others => '0');
      else
        LedCount    <= LedCount + 1;
      end if;
    end if;
  end process;
  FPGA_LED0_N <= '0' when LedCount(LedCount'high) = '0' else 'Z';
  FPGA_LED1_N <= '0' when LED_N(0) = '0' else 'Z';
  FPGA_LED2_N <= '0' when LED_N(1) = '0' else 'Z';
  DDR3_VSEL <= 'Z';
  ETH1_CLK <= Clk25;
  IRQ1 <= not ETH0_INT_N_PL;

end rtl;
