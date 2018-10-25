----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2018 15:48:04
-- Design Name: 
-- Module Name: sim_2 - Behavioral
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

entity sim_2 is
--  Port ( );
end sim_2;

architecture Behavioral of sim_2 is
signal clk, D : STD_LOGIC := '0';
signal lQ, fQ, T : STD_LOGIC := '0';
component top_2
    Port ( clk : in STD_LOGIC;
           D : in STD_LOGIC;
           lQ : out STD_LOGIC;
           fQ : out STD_LOGIC;
           T : out STD_LOGIC);
    end component;
begin
    U1 : top_2 port map
        (clk => clk,
        D => D,
        lQ => lQ,
        fQ => fQ,
        T => T);
    CLOCKER : process
    constant period : time := 15 ns;
    begin
    wait for period;
    clk <= not clk;
    end process CLOCKER;
    
    STIM : process
    constant period : time := 10 ns;
    begin
    for I in 0 to 16 
    loop
        D <= '0';
        wait for period;
        D <= '1';
        wait for period;
        D <= '0';
        wait for period*2;
        D <= '1';
        wait for period;
    end loop;
    D <= '0';
    wait;
    end process STIM;

end Behavioral;
