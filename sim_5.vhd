----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2018 10:49:31
-- Design Name: 
-- Module Name: sim_5 - Behavioral
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

entity sim_5 is
--  Port ( );
end sim_5;

architecture Behavioral of sim_5 is

signal clk :  STD_LOGIC := '0';
signal a, b : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
signal add_sub : STD_LOGIC := '0';
signal Q : STD_LOGIC_VECTOR (3 downto 0);
    component top_7
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           add_sub : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
begin
    U1 : top_7 port map
        (clk => clk,
        a => a,
        b => b,
        add_sub => add_sub,
        Q => Q);
    CLOCKER : process
    constant period : time := 10 ns;
    begin
    clk <= not clk;
    wait for period;
    end process CLOCKER;
    
    STIM : process
    constant period : time := 20 ns;
    begin
    wait for period * 3;
    for I in 0 to 1 
    loop
        wait for period;
        a <= "00";
        b <= "00";
        wait for period;
        a <= "01";
        b <= "00";
        wait for period;
        a <= "10";
        b <= "00";
        wait for period;
        a <= "11";
        b <= "00";
        wait for period;
        a <= "00";
        b <= "01";
        wait for period;
        a <= "01";
        b <= "01";
        wait for period;
        a <= "10";
        b <= "01";
        wait for period;
        a <= "11";
        b <= "01";
        wait for period;
        a <= "00";
        b <= "10";
        wait for period;
        a <= "01";
        b <= "10";
        wait for period;
        a <= "10";
        b <= "10";
        wait for period;
        a <= "11";
        b <= "10";
        wait for period;
        a <= "00";
        b <= "11";
        wait for period;
        a <= "01";
        b <= "11";
        wait for period;
        a <= "10";
        b <= "11";
        wait for period;
        a <= "11";
        b <= "11";
        wait for period;
        add_sub <= not add_sub;
    end loop;
    wait;
    end process STIM;

end Behavioral;
