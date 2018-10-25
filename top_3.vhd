----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2018 09:46:43
-- Design Name: 
-- Module Name: top_3 - Behavioral
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

--JK-trigger
entity top_3 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           J : in STD_LOGIC;
           K : in STD_LOGIC;
           Q : out STD_LOGIC := '0';
           nQ : out STD_LOGIC := '1');
end top_3;

architecture Behavioral of top_3 is
signal sQ : STD_LOGIC := '0';
begin
    JK : process  (clk, rst)
    begin
        if (rst  = '1')
        then
            sQ <= '0';
            --SC_snQ <= '1';
        elsif (rising_edge(clk))
        then
            if (K = '1')
            then
                if (J = '1') 
                then
                    sQ <= not sQ;
                else
                    sQ <= '0';
                end if;
            elsif (J = '1')
            then
                sQ <= '1';
            end if;
        end if;
    end process JK;
    Q <= sQ;
    nQ <= not sQ;
end Behavioral;
