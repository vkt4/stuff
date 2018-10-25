----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2018 12:06:32
-- Design Name: 
-- Module Name: sim_4 - Behavioral
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

entity sim_4 is
--  Port ( );
end sim_4;

architecture Behavioral of sim_4 is

component top_4
Port ( clk : in STD_LOGIC;
       Q : out STD_LOGIC;
       Qtot : out STD_LOGIC_VECTOR(7-1 downto 0));
end component;

component top_5
Port ( clk : in STD_LOGIC;
       Q : out STD_LOGIC);
end component;

component top_6
Generic (M : NATURAL range 3 to 12;
         P : STD_LOGIC_VECTOR (12 downto 0) := (others => '0')); 
Port ( clk : in STD_LOGIC;
       Q : out STD_LOGIC);
end component;

constant M : NATURAL range 3 to 12 := 4;            -- M-seq order
constant P : STD_LOGIC_VECTOR := "0000000001100";   -- M-seq Polynomial

signal clk : STD_LOGIC := '0';
signal Q1, Q2, Q3 : STD_LOGIC;
signal Qtot : STD_LOGIC_VECTOR(7-1 downto 0);
--signal Qtot_M : STD_LOGIC_VECTOR(M-1 downto 0) := (others => '0');


begin
    U1 : top_4 port map
        (clk => clk,
        Q => Q1,
        Qtot => Qtot);
        
   U2 : top_5 port map
        (clk => clk,
        Q => Q2);
        
    U3 : top_6
     generic map
        (M => M,
         P => P)
         -----"000000000000")----
     port map
        (clk => clk,
        Q => Q3);
        --Qtot => Qtot_M);
        
    CLOCKER : process
    constant period : time := 15 ns;
    begin
    wait for period;
    clk <= not clk;
    end process CLOCKER;

end Behavioral;
