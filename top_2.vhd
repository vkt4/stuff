----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2018 15:37:27
-- Design Name: 
-- Module Name: top_2 - Behavioral
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

-- Flip-flops: level and front, T-trigger
entity top_2 is
     Port (clk : in STD_LOGIC;
         --rst : in STD_LOGIC;
           D : in STD_LOGIC;
           fQ : out STD_LOGIC := '0';
           lQ : out STD_LOGIC := '0';
           T : out STD_LOGIC);
end top_2;

architecture Behavioral of top_2 is
signal sT : STD_LOGIC := '0';
begin
    --Process?
    lQ <= D when clk = '1';
---------------------------------
    fQ <= D when rising_edge(clk);
---------------------------------
    sT <=  not sT when rising_edge(clk);
    T <= sT;
end Behavioral;
