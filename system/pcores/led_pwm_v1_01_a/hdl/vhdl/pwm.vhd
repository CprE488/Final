----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:52:27 11/19/2014 
-- Design Name: 
-- Module Name:    pwm - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           top : in  STD_LOGIC_VECTOR (31 downto 0);
           duty_cycle : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC);
end pwm;

architecture Behavioral of pwm is
signal timer_count              : unsigned(31 downto 0);
signal out_signal               : std_logic;

begin
    pwm_proc: process(clk, rst)
    begin
        if(rst = '1') then
            timer_count <= (others => '0');
            out_signal <= '1';
        elsif(rising_edge(clk)) then
            if(enable = '1') then
                timer_count <= timer_count + 1;
            end if;
            if(timer_count > unsigned(top)) then
                timer_count <= (others => '0');
            end if;
            if(timer_count < unsigned(duty_cycle)) then
                out_signal <= '0';
            else
                out_signal <= '1';
            end if;
        end if;
    end process;
    
    output <= out_signal;
    
end Behavioral;

