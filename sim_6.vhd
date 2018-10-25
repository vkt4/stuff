----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2018 09:22:29
-- Design Name: 
-- Module Name: sim_6 - Behavioral
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

entity sim_6 is
--  Port ( );
end sim_6;

architecture Behavioral of sim_6 is

COMPONENT top_9 is
    GENERIC ( DURATION : NATURAL RANGE 1 TO 100000 := 1);
    Port ( clk : in STD_LOGIC;
           trg : in STD_LOGIC;
           Q   : out STD_LOGIC := '0');
end component;

COMPONENT top_8 is
    Generic ( DIV : NATURAL RANGE 1 to 100000 := 1;
              BORDER : NATURAL RANGE 1 to 100000 := 1);
    Port ( clk : in STD_LOGIC;
           o_clk : out STD_LOGIC);
end component;

signal clk : STD_LOGIC := '0';
signal o_clk, Q : STD_LOGIC := '0';
signal trg : STD_LOGIC := '0';
begin
    clk_div : top_8 
    generic map
    (DIV => 4,
     BORDER => 2)
    port map
    (clk => clk,
     o_clk => o_clk);
     
    one_shot : top_9
    generic map
    (
      DURATION => 5  
    )
    port map
    (
      clk => clk,
      trg => trg,
      Q => Q
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
            trg <= '1';
            wait for period;
            trg <= '0';
            wait for period *2;
            trg <= '1';
            wait for period;
            trg <= '0';
            wait for period*20;
            trg <= '1';
            wait for period;
            trg <= '0';
            wait for period*(20.3);
            trg <= '1';
            wait for period*20;
            trg <= '0';
        wait;
    end process STIM;
end Behavioral;
