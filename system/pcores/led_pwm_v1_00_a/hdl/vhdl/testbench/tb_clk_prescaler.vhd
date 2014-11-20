--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:40:42 11/19/2014
-- Design Name:   
-- Module Name:   /home/vens/classes/Fall2014/cpre488/labs/final/Final/system/pcores/led_pwm_v1_00_a/hdl/vhdl/testbench/tb_clk_prescaler.vhd
-- Project Name:  led_pwm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clk_prescaler
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
--USE ieee.numeric_std.ALL;
 
ENTITY tb_clk_prescaler IS
END tb_clk_prescaler;
 
ARCHITECTURE behavior OF tb_clk_prescaler IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clk_prescaler
    PORT(
         in_clk : IN  std_logic;
         rst : in STD_LOGIC;
         prescaler_value : IN  std_logic_vector(4 downto 0);
         out_clk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in_clk : std_logic := '0';
   signal prescaler_value : std_logic_vector(4 downto 0) := (others => '0');
   signal rst : std_logic;

 	--Outputs
   signal out_clk : std_logic;

   -- Clock period definitions
   constant in_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clk_prescaler PORT MAP (
          in_clk => in_clk,
          rst => rst,
          prescaler_value => prescaler_value,
          out_clk => out_clk
        );

   -- Clock process definitions
   in_clk_process :process
   begin
		in_clk <= '0';
		wait for in_clk_period/2;
		in_clk <= '1';
		wait for in_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
      
      wait for 100 ns;
      
      rst <= '0';
      
      -- hold reset state for 100 ns.
      prescaler_value <= "00010";

      wait for in_clk_period*24;
      
      prescaler_value <= "01100";

      wait for in_clk_period*10000;
      
      prescaler_value <= "00000";
      
      wait for in_clk_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
