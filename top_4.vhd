----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2018 11:53:40
-- Design Name: 
-- Module Name: top_4 - Behavioral
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

entity top_4 is
    Port ( clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qtot : out STD_LOGIC_VECTOR(7-1 downto 0));
end top_4;
--BARKER (1/2 regs)
architecture Behavioral of top_4 is
signal s_Q : STD_LOGIC_VECTOR ( 7-1 downto 0) := (others => '0');
begin
    process (clk)
    begin
        if (rising_edge(clk))
        then
            s_Q <= s_Q(7-2 downto 0) & not (s_Q(7-1) and (s_Q(7-2)));
        end if;
    end process;
    Q <= not ((s_Q(5) and s_Q(0)) or (s_Q(3) and not s_Q(2)) or (s_Q(5) and not s_Q(4)));
    Qtot <= s_Q;
end Behavioral;
