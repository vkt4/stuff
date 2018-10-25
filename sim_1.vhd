----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2018 14:53:09
-- Design Name: 
-- Module Name: sim_1 - Behavioral
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

entity sim_1 is
--  Port ( );
end sim_1;

architecture Behavioral of sim_1 is
    signal clk :  STD_LOGIC := '0';
    signal rst :  STD_LOGIC := '0';
    signal R :  STD_LOGIC := '0';
    signal S :  STD_LOGIC := '0';
    signal A_Q, A_nQ, S_Q, S_nQ :  STD_LOGIC; 
    component top_1
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           R : in STD_LOGIC;
           S : in STD_LOGIC;
           RS_Async_Q : out STD_LOGIC;
           RS_Async_nQ : out STD_LOGIC;
           RS_Sync_Q  : out STD_LOGIC;
           RS_Sync_nQ : out STD_LOGIC);
    end component;
begin
    U1 : top_1 port map
        (clk => clk,
        rst => rst,
        R => R,
        S => S,
        RS_Async_Q => A_Q,
        RS_Async_nQ => A_NQ,
        RS_Sync_Q => S_Q,
        RS_Sync_nQ => S_NQ);
    CLOCKER : process
    constant period : time := 10 ns;
    begin
    clk <= not clk;
    wait for period;
    end process CLOCKER;
    
    STIM : process
    constant period : time := 11.25 ns;
    begin
    rst <= '1';
    wait for period;
    rst <= '0';
    for I in 0 to 16 
    loop
        wait for period;
        R <= '1';
        wait for period;
        R <= '0';
        wait for period;
        S <= '1';
        wait for period;
        S <= '0';
    end loop;
    wait for period;
    --S <= '1';
    --R <= '1';
    wait for period;
    S <= '0';
    R <= '0';
    wait for period*2;
    S <= '1';
    R <= '1';
    wait;
    end process STIM;
    
end Behavioral;
