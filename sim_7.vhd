----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2018 12:00:24
-- Design Name: 
-- Module Name: sim_7 - Behavioral
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

entity sim_7 is
--  Port ( );
end sim_7;

architecture Behavioral of sim_7 is

signal clk : STD_LOGIC := '0';
signal rst : STD_LOGIC := '0';
signal inc, dec : STD_LOGIC := '0';
signal Q_nat, Q_rev : STD_LOGIC_VECTOR (3 downto 0);

component top_10 is
    Port ( clk : in STD_LOGIC;
           inc : in STD_LOGIC;
           Q   : out STD_LOGIC_VECTOR (3 downto 0) := "0000");
end component;

component top_12 is
    Port ( clk : in STD_LOGIC;
           inc : in STD_LOGIC;
           dec : in STD_LOGIC;
           rst : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin
    u_counter : top_10 port map
    (
        clk => clk,
        inc => inc,
        Q => Q_nat
    );
    ud_counter : top_12 port map
    (
        clk => clk,
        inc => inc, 
        dec => dec,
        rst => rst,
        Q => Q_rev
    );

    CLOCKER : process
        constant period : time := 10 ns;
        begin
            wait for period;
            clk <= not clk;
    end process CLOCKER;
    
    STIM : process
        constant period : time := 10 ns;
        begin
            wait for period * 3;
            for i in 0 to 16
            loop
                inc <= '1';
                wait for period;
                inc <= '0';
                wait for period;
            end loop;
            for i in 0 to 16
            loop
                dec <= '1';
                wait for period;
                dec <= '0';
                wait for period;
            end loop;
            for i in 0 to 8
            loop
                inc <= '1';
                wait for period;
                inc <= '0';
                wait for period;
            end loop;
            for i in 0 to 20
            loop
                dec <= '1';
                wait for period;
                dec <= '0';
                wait for period;
            end loop;
        wait;
    end process STIM;
end Behavioral;
