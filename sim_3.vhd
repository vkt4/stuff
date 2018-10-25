----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.10.2018 11:51:25
-- Design Name: 
-- Module Name: sim_3 - Behavioral
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

entity sim_3 is
--  Port ( );
end sim_3;

architecture Behavioral of sim_3 is
signal clk, rst, J, K : STD_LOGIC := '0';
signal Q, nQ : STD_LOGIC := '0';
component top_3
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           J : in STD_LOGIC;
           K : in STD_LOGIC;
           Q : out STD_LOGIC;
           nQ : out STD_LOGIC);
    end component;
begin
     U1 : top_3 port map
       (clk => clk,
       rst => rst,
       J => J,
       K => K,
       Q => Q,
       nQ => nQ);
   CLOCKER : process
   constant period : time := 10 ns;
   begin
   wait for period;
   clk <= not clk;
   end process CLOCKER;
   
   STIM : process
   constant period : time := 10*2 ns;
   begin
    J <= '0';
    wait for period;
    J <= '1';
    wait for period;
    J <= '0';
    wait for period;
    rst <= '1';
    wait for period;
    rst <= '0';
    wait for period;
   for I in 0 to 4 
   loop
        J <= '1';
        wait for period;
        J <= '0';
        K <= '1';
        wait for period;
        K <= '0';
        wait for period;
        J <= '1';
        wait for period;
        J <= '0';
        wait for period;
        J <= '1';
        K <= '1';
        wait for period;
        J <= '0';
        wait for period;
        K <= '0';
        wait for period;
        J <= '1';
        K <= '1';
        wait for period;
        J <= '0';
        K <= '0';
        wait for period;
   end loop;
   rst <= '1';
   wait for period;
   rst <= '0';
   wait;
   end process STIM;

end Behavioral;
