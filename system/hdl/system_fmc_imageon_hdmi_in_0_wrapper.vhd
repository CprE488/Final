-------------------------------------------------------------------------------
-- system_fmc_imageon_hdmi_in_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library fmc_imageon_hdmi_in_v2_01_a;
use fmc_imageon_hdmi_in_v2_01_a.all;

entity system_fmc_imageon_hdmi_in_0_wrapper is
  port (
    clk : in std_logic;
    io_hdmii_spdif : in std_logic;
    io_hdmii_video : in std_logic_vector(15 downto 0);
    video_vblank : out std_logic;
    video_hblank : out std_logic;
    video_de : out std_logic;
    video_data : out std_logic_vector(15 downto 0);
    audio_spdif : out std_logic;
    debug_o : out std_logic_vector(23 downto 0)
  );
end system_fmc_imageon_hdmi_in_0_wrapper;

architecture STRUCTURE of system_fmc_imageon_hdmi_in_0_wrapper is

  component fmc_imageon_hdmi_in is
    generic (
      C_FAMILY : STRING;
      C_DATA_WIDTH : INTEGER
    );
    port (
      clk : in std_logic;
      io_hdmii_spdif : in std_logic;
      io_hdmii_video : in std_logic_vector(15 downto 0);
      video_vblank : out std_logic;
      video_hblank : out std_logic;
      video_de : out std_logic;
      video_data : out std_logic_vector((C_DATA_WIDTH-1) downto 0);
      audio_spdif : out std_logic;
      debug_o : out std_logic_vector(23 downto 0)
    );
  end component;

begin

  fmc_imageon_hdmi_in_0 : fmc_imageon_hdmi_in
    generic map (
      C_FAMILY => "zynq",
      C_DATA_WIDTH => 16
    )
    port map (
      clk => clk,
      io_hdmii_spdif => io_hdmii_spdif,
      io_hdmii_video => io_hdmii_video,
      video_vblank => video_vblank,
      video_hblank => video_hblank,
      video_de => video_de,
      video_data => video_data,
      audio_spdif => audio_spdif,
      debug_o => debug_o
    );

end architecture STRUCTURE;

