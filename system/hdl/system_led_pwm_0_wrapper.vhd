-------------------------------------------------------------------------------
-- system_led_pwm_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library led_pwm_v1_01_a;
use led_pwm_v1_01_a.all;

entity system_led_pwm_0_wrapper is
  port (
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
    S_AXI_ACLK : in std_logic;
    S_AXI_ARESETN : in std_logic;
    S_AXI_AWADDR : in std_logic_vector(31 downto 0);
    S_AXI_AWVALID : in std_logic;
    S_AXI_WDATA : in std_logic_vector(31 downto 0);
    S_AXI_WSTRB : in std_logic_vector(3 downto 0);
    S_AXI_WVALID : in std_logic;
    S_AXI_BREADY : in std_logic;
    S_AXI_ARADDR : in std_logic_vector(31 downto 0);
    S_AXI_ARVALID : in std_logic;
    S_AXI_RREADY : in std_logic;
    S_AXI_ARREADY : out std_logic;
    S_AXI_RDATA : out std_logic_vector(31 downto 0);
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    S_AXI_RVALID : out std_logic;
    S_AXI_WREADY : out std_logic;
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_BVALID : out std_logic;
    S_AXI_AWREADY : out std_logic
  );
end system_led_pwm_0_wrapper;

architecture STRUCTURE of system_led_pwm_0_wrapper is

  component led_pwm is
    generic (
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_MIN_SIZE : std_logic_vector;
      C_USE_WSTRB : INTEGER;
      C_DPHASE_TIMEOUT : INTEGER;
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_FAMILY : STRING;
      C_NUM_REG : INTEGER;
      C_NUM_MEM : INTEGER;
      C_SLV_AWIDTH : INTEGER;
      C_SLV_DWIDTH : INTEGER
    );
    port (
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
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_WDATA : in std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_WSTRB : in std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_RREADY : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_AWREADY : out std_logic
    );
  end component;

begin

  led_pwm_0 : led_pwm
    generic map (
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_MIN_SIZE => X"000001ff",
      C_USE_WSTRB => 0,
      C_DPHASE_TIMEOUT => 8,
      C_BASEADDR => X"76600000",
      C_HIGHADDR => X"7660ffff",
      C_FAMILY => "zynq",
      C_NUM_REG => 32,
      C_NUM_MEM => 1,
      C_SLV_AWIDTH => 32,
      C_SLV_DWIDTH => 32
    )
    port map (
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
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_AWADDR => S_AXI_AWADDR,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_WDATA => S_AXI_WDATA,
      S_AXI_WSTRB => S_AXI_WSTRB,
      S_AXI_WVALID => S_AXI_WVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_ARADDR => S_AXI_ARADDR,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_RDATA => S_AXI_RDATA,
      S_AXI_RRESP => S_AXI_RRESP,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_BRESP => S_AXI_BRESP,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_AWREADY => S_AXI_AWREADY
    );

end architecture STRUCTURE;

