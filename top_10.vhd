----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2018 10:19:47
-- Design Name: 
-- Module Name: top_10 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Count upward
entity top_10 is
    Port ( clk : in STD_LOGIC;
           inc : in STD_LOGIC;
           Q   : out STD_LOGIC_VECTOR (3 downto 0) := "0000");
end top_10;

architecture Behavioral of top_10 is

    signal count : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin
    process (clk)
    begin
        if (inc = '1')
        then
            count <= count + 1;
        end if;
    end process;
    Q <= count;
end Behavioral;
