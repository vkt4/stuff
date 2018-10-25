----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2018 10:25:19
-- Design Name: 
-- Module Name: top_12 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- is different from numeric_std?

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Inc-dec counter
entity top_12 is
    Port ( clk : in STD_LOGIC;
           inc : in STD_LOGIC;
           dec : in STD_LOGIC;
           rst : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end top_12;

architecture Behavioral of top_12 is
    signal count : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin

    process(clk, rst)
    begin
        if (rst = '1')
        then
            count <= "0000";
        elsif (inc = '1')
        then
            count <= count + 1;
            --count <= std_logic_vector (unsigned(count) +  "0001:);
        elsif (dec = '1')
        then
            count <= count - 1;
            --count <= std_logic_vector (unsigned(count) -  "0001");
        end if;
    end process;
    
    Q <= count;

end Behavioral;
