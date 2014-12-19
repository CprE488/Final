-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    SWs_8Bits_TRI_IO : inout std_logic_vector(7 downto 0);
    LEDs_8Bits_TRI_IO : out std_logic_vector(7 downto 0);
    BTNs_5Bits_TRI_IO : inout std_logic_vector(4 downto 0);
    processing_system7_0_MIO : inout std_logic_vector(53 downto 0);
    processing_system7_0_PS_SRSTB : in std_logic;
    processing_system7_0_PS_CLK : in std_logic;
    processing_system7_0_PS_PORB : in std_logic;
    processing_system7_0_DDR_Clk : inout std_logic;
    processing_system7_0_DDR_Clk_n : inout std_logic;
    processing_system7_0_DDR_CKE : inout std_logic;
    processing_system7_0_DDR_CS_n : inout std_logic;
    processing_system7_0_DDR_RAS_n : inout std_logic;
    processing_system7_0_DDR_CAS_n : inout std_logic;
    processing_system7_0_DDR_WEB_pin : out std_logic;
    processing_system7_0_DDR_BankAddr : inout std_logic_vector(2 downto 0);
    processing_system7_0_DDR_Addr : inout std_logic_vector(14 downto 0);
    processing_system7_0_DDR_ODT : inout std_logic;
    processing_system7_0_DDR_DRSTB : inout std_logic;
    processing_system7_0_DDR_DQ : inout std_logic_vector(31 downto 0);
    processing_system7_0_DDR_DM : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_DQS : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_DQS_n : inout std_logic_vector(3 downto 0);
    processing_system7_0_DDR_VRN : inout std_logic;
    processing_system7_0_DDR_VRP : inout std_logic;
    fmc_imageon_iic_0_Sda_pin : inout std_logic;
    fmc_imageon_iic_0_Scl_pin : inout std_logic;
    fmc_imageon_hdmi_out_0_io_hdmio_spdif_pin : out std_logic;
    fmc_imageon_hdmi_out_0_io_hdmio_video_pin : out std_logic_vector(15 downto 0);
    fmc_imageon_hdmi_out_0_io_hdmio_clk_pin : out std_logic;
    fmc_imageon_hdmi_in_0_io_hdmii_spdif_pin : in std_logic;
    fmc_imageon_hdmi_in_0_io_hdmii_video_pin : in std_logic_vector(15 downto 0);
    fmc_imageon_hdmi_in_0_clk_pin : in std_logic;
    fmc_imageon_video_clk1_pin : in std_logic;
    led0 : out std_logic;
    led1 : out std_logic;
    led2 : out std_logic;
    led3 : out std_logic;
    led4 : out std_logic;
    led5 : out std_logic;
    led6 : out std_logic;
    led7 : out std_logic;
    led8 : out std_logic;
    led9 : out std_logic;
    led10 : out std_logic;
    led11 : out std_logic;
    led12 : out std_logic;
    led13 : out std_logic;
    led14 : out std_logic;
    led15 : out std_logic;
    led16 : out std_logic;
    led17 : out std_logic;
    led18 : out std_logic;
    led19 : out std_logic;
    led20 : out std_logic;
    led21 : out std_logic;
    led22 : out std_logic;
    led23 : out std_logic;
    led24 : out std_logic;
    led25 : out std_logic;
    led26 : out std_logic;
    led27 : out std_logic;
    led28 : out std_logic;
    led29 : out std_logic;
    fmc_imageon_iic_0_Reset_pin : out std_logic
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      SWs_8Bits_TRI_IO : inout std_logic_vector(7 downto 0);
      LEDs_8Bits_TRI_IO : out std_logic_vector(7 downto 0);
      BTNs_5Bits_TRI_IO : inout std_logic_vector(4 downto 0);
      processing_system7_0_MIO : inout std_logic_vector(53 downto 0);
      processing_system7_0_PS_SRSTB : in std_logic;
      processing_system7_0_PS_CLK : in std_logic;
      processing_system7_0_PS_PORB : in std_logic;
      processing_system7_0_DDR_Clk : inout std_logic;
      processing_system7_0_DDR_Clk_n : inout std_logic;
      processing_system7_0_DDR_CKE : inout std_logic;
      processing_system7_0_DDR_CS_n : inout std_logic;
      processing_system7_0_DDR_RAS_n : inout std_logic;
      processing_system7_0_DDR_CAS_n : inout std_logic;
      processing_system7_0_DDR_WEB_pin : out std_logic;
      processing_system7_0_DDR_BankAddr : inout std_logic_vector(2 downto 0);
      processing_system7_0_DDR_Addr : inout std_logic_vector(14 downto 0);
      processing_system7_0_DDR_ODT : inout std_logic;
      processing_system7_0_DDR_DRSTB : inout std_logic;
      processing_system7_0_DDR_DQ : inout std_logic_vector(31 downto 0);
      processing_system7_0_DDR_DM : inout std_logic_vector(3 downto 0);
      processing_system7_0_DDR_DQS : inout std_logic_vector(3 downto 0);
      processing_system7_0_DDR_DQS_n : inout std_logic_vector(3 downto 0);
      processing_system7_0_DDR_VRN : inout std_logic;
      processing_system7_0_DDR_VRP : inout std_logic;
      fmc_imageon_iic_0_Sda_pin : inout std_logic;
      fmc_imageon_iic_0_Scl_pin : inout std_logic;
      fmc_imageon_hdmi_out_0_io_hdmio_spdif_pin : out std_logic;
      fmc_imageon_hdmi_out_0_io_hdmio_video_pin : out std_logic_vector(15 downto 0);
      fmc_imageon_hdmi_out_0_io_hdmio_clk_pin : out std_logic;
      fmc_imageon_hdmi_in_0_io_hdmii_spdif_pin : in std_logic;
      fmc_imageon_hdmi_in_0_io_hdmii_video_pin : in std_logic_vector(15 downto 0);
      fmc_imageon_hdmi_in_0_clk_pin : in std_logic;
      fmc_imageon_video_clk1_pin : in std_logic;
      led0 : out std_logic;
      led1 : out std_logic;
      led2 : out std_logic;
      led3 : out std_logic;
      led4 : out std_logic;
      led5 : out std_logic;
      led6 : out std_logic;
      led7 : out std_logic;
      led8 : out std_logic;
      led9 : out std_logic;
      led10 : out std_logic;
      led11 : out std_logic;
      led12 : out std_logic;
      led13 : out std_logic;
      led14 : out std_logic;
      led15 : out std_logic;
      led16 : out std_logic;
      led17 : out std_logic;
      led18 : out std_logic;
      led19 : out std_logic;
      led20 : out std_logic;
      led21 : out std_logic;
      led22 : out std_logic;
      led23 : out std_logic;
      led24 : out std_logic;
      led25 : out std_logic;
      led26 : out std_logic;
      led27 : out std_logic;
      led28 : out std_logic;
      led29 : out std_logic;
      fmc_imageon_iic_0_Reset_pin : out std_logic
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      SWs_8Bits_TRI_IO => SWs_8Bits_TRI_IO,
      LEDs_8Bits_TRI_IO => LEDs_8Bits_TRI_IO,
      BTNs_5Bits_TRI_IO => BTNs_5Bits_TRI_IO,
      processing_system7_0_MIO => processing_system7_0_MIO,
      processing_system7_0_PS_SRSTB => processing_system7_0_PS_SRSTB,
      processing_system7_0_PS_CLK => processing_system7_0_PS_CLK,
      processing_system7_0_PS_PORB => processing_system7_0_PS_PORB,
      processing_system7_0_DDR_Clk => processing_system7_0_DDR_Clk,
      processing_system7_0_DDR_Clk_n => processing_system7_0_DDR_Clk_n,
      processing_system7_0_DDR_CKE => processing_system7_0_DDR_CKE,
      processing_system7_0_DDR_CS_n => processing_system7_0_DDR_CS_n,
      processing_system7_0_DDR_RAS_n => processing_system7_0_DDR_RAS_n,
      processing_system7_0_DDR_CAS_n => processing_system7_0_DDR_CAS_n,
      processing_system7_0_DDR_WEB_pin => processing_system7_0_DDR_WEB_pin,
      processing_system7_0_DDR_BankAddr => processing_system7_0_DDR_BankAddr,
      processing_system7_0_DDR_Addr => processing_system7_0_DDR_Addr,
      processing_system7_0_DDR_ODT => processing_system7_0_DDR_ODT,
      processing_system7_0_DDR_DRSTB => processing_system7_0_DDR_DRSTB,
      processing_system7_0_DDR_DQ => processing_system7_0_DDR_DQ,
      processing_system7_0_DDR_DM => processing_system7_0_DDR_DM,
      processing_system7_0_DDR_DQS => processing_system7_0_DDR_DQS,
      processing_system7_0_DDR_DQS_n => processing_system7_0_DDR_DQS_n,
      processing_system7_0_DDR_VRN => processing_system7_0_DDR_VRN,
      processing_system7_0_DDR_VRP => processing_system7_0_DDR_VRP,
      fmc_imageon_iic_0_Sda_pin => fmc_imageon_iic_0_Sda_pin,
      fmc_imageon_iic_0_Scl_pin => fmc_imageon_iic_0_Scl_pin,
      fmc_imageon_hdmi_out_0_io_hdmio_spdif_pin => fmc_imageon_hdmi_out_0_io_hdmio_spdif_pin,
      fmc_imageon_hdmi_out_0_io_hdmio_video_pin => fmc_imageon_hdmi_out_0_io_hdmio_video_pin,
      fmc_imageon_hdmi_out_0_io_hdmio_clk_pin => fmc_imageon_hdmi_out_0_io_hdmio_clk_pin,
      fmc_imageon_hdmi_in_0_io_hdmii_spdif_pin => fmc_imageon_hdmi_in_0_io_hdmii_spdif_pin,
      fmc_imageon_hdmi_in_0_io_hdmii_video_pin => fmc_imageon_hdmi_in_0_io_hdmii_video_pin,
      fmc_imageon_hdmi_in_0_clk_pin => fmc_imageon_hdmi_in_0_clk_pin,
      fmc_imageon_video_clk1_pin => fmc_imageon_video_clk1_pin,
      led0 => led0,
      led1 => led1,
      led2 => led2,
      led3 => led3,
      led4 => led4,
      led5 => led5,
      led6 => led6,
      led7 => led7,
      led8 => led8,
      led9 => led9,
      led10 => led10,
      led11 => led11,
      led12 => led12,
      led13 => led13,
      led14 => led14,
      led15 => led15,
      led16 => led16,
      led17 => led17,
      led18 => led18,
      led19 => led19,
      led20 => led20,
      led21 => led21,
      led22 => led22,
      led23 => led23,
      led24 => led24,
      led25 => led25,
      led26 => led26,
      led27 => led27,
      led28 => led28,
      led29 => led29,
      fmc_imageon_iic_0_Reset_pin => fmc_imageon_iic_0_Reset_pin
    );

end architecture STRUCTURE;

