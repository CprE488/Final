----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:20:16 11/19/2014 
-- Design Name: 
-- Module Name:    clk_prescaler - Behavioral 
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

entity clk_prescaler is
    Port ( in_clk : in  STD_LOGIC;
           rst : in STD_LOGIC;
           prescaler_value : in  STD_LOGIC_VECTOR (4 downto 0);
           out_clk : out  STD_LOGIC);
end clk_prescaler;

architecture Behavioral of clk_prescaler is
signal clk_count                : unsigned(31 downto 0);
signal clk_count_vector         : std_logic_vector(31 downto 0);

begin
    clock_scaler_proc: process(in_clk, rst)
    begin
        if(rst = '1') then
            clk_count <= (others => '0');
            out_clk <= '0';
        elsif(rising_edge(in_clk)) then
            clk_count <= clk_count + 1;
            case prescaler_value is
                when "00000" =>
                    out_clk <= in_clk;
                when "00001" =>
                    out_clk <= clk_count_vector(0);
                when "00010" =>
                    out_clk <= clk_count_vector(1);
                when "00011" =>
                    out_clk <= clk_count_vector(2);
                when "00100" =>
                    out_clk <= clk_count_vector(3);
                when "00101" =>
                    out_clk <= clk_count_vector(4);
                when "00110" =>
                    out_clk <= clk_count_vector(5);
                when "00111" =>
                    out_clk <= clk_count_vector(6);
                when "01000" =>
                    out_clk <= clk_count_vector(7);
                when "01001" =>
                    out_clk <= clk_count_vector(8);
                when "01010" =>
                    out_clk <= clk_count_vector(9);
                when "01011" =>
                    out_clk <= clk_count_vector(10);
                when "01100" =>
                    out_clk <= clk_count_vector(11);
                when "01101" =>
                    out_clk <= clk_count_vector(12);
                when "01110" =>
                    out_clk <= clk_count_vector(13);
                when "01111" =>
                    out_clk <= clk_count_vector(14);
                when "10000" =>
                    out_clk <= clk_count_vector(15);            
                when "10001" =>
                    out_clk <= clk_count_vector(16);
                when "10010" =>
                    out_clk <= clk_count_vector(17);
                when "10011" =>
                    out_clk <= clk_count_vector(18);
                when "10100" =>
                    out_clk <= clk_count_vector(19);
                when "10101" =>
                    out_clk <= clk_count_vector(20);
                when "10110" =>
                    out_clk <= clk_count_vector(21);
                when "10111" =>
                    out_clk <= clk_count_vector(22);
                when "11000" =>
                    out_clk <= clk_count_vector(23);
                when "11001" =>
                    out_clk <= clk_count_vector(24);
                when "11010" =>
                    out_clk <= clk_count_vector(25);
                when "11011" =>
                    out_clk <= clk_count_vector(26);
                when "11100" =>
                    out_clk <= clk_count_vector(27);
                when "11101" =>
                    out_clk <= clk_count_vector(28);
                when "11110" =>
                    out_clk <= clk_count_vector(29);
                when "11111" =>
                    out_clk <= clk_count_vector(30);
                when others =>
                    out_clk <= '0';
            end case;
        end if;
    end process;
    
    clk_count_vector <= std_logic_vector(clk_count);

end Behavioral;

