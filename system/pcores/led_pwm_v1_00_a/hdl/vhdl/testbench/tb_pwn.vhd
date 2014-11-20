--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:53:44 11/19/2014
-- Design Name:   
-- Module Name:   /home/vens/classes/Fall2014/cpre488/labs/final/Final/system/pcores/led_pwm_v1_00_a/hdl/vhdl/testbench/tb_pwn.vhd
-- Project Name:  led_pwm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pwm
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_pwn IS
END tb_pwn;
 
ARCHITECTURE behavior OF tb_pwn IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pwm
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         enable : IN  std_logic;
         top : IN  std_logic_vector(31 downto 0);
         duty_cycle : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal enable : std_logic := '0';
   signal top : std_logic_vector(31 downto 0) := (others => '0');
   signal duty_cycle : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pwm PORT MAP (
          clk => clk,
          rst => rst,
          enable => enable,
          top => top,
          duty_cycle => duty_cycle,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rst  <= '1';
      enable <= '1';
      top <= std_logic_vector(to_unsigned(65536, 32));
      duty_cycle <= std_logic_vector(to_unsigned(32768, 32));
      wait for 100 ns;	
      rst <= '0';
      
      wait for clk_period*500000;
      duty_cycle <= std_logic_vector(to_unsigned(100, 32));
      wait for clk_period*500000;
      duty_cycle <= std_logic_vector(to_unsigned(60000, 32));
      wait for clk_period*500000;
      duty_cycle <= std_logic_vector(to_unsigned(32768, 32));
      enable <= '0';
      wait for clk_period*100000;
      enable <= '1';
      wait for clk_period*100000;
      -- insert stimulus here 

      wait;
   end process;

END;
