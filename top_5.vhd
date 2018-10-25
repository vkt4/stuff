----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2018 12:47:59
-- Design Name: 
-- Module Name: top_5 - Behavioral
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

entity top_5 is
Port ( clk : in STD_LOGIC;
       Q : out STD_LOGIC);
end top_5;
-- Barker
architecture Behavioral of top_5 is
signal s_Q : STD_LOGIC_VECTOR ( 13-1 downto 0) := "1111110011010";
begin

    s_Q <= (s_Q(13-2 downto 0) & s_Q(13-1)) when rising_edge(clk);
    Q <= s_Q(13-1);

end Behavioral;
