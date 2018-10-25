----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2018 13:08:18
-- Design Name: 
-- Module Name: top_11 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- BARKER correlator
entity top_11 is
    Port ( clk : in STD_LOGIC;
           push_one : in STD_LOGIC;
           push_zero : in STD_LOGIC;
           push_cyclic : in STD_LOGIC;
           push_random : in STD_LOGIC;
           test : out STD_LOGIC_VECTOR (12 downto 0) := (others => '0');
           Q : out STD_LOGIC_VECTOR (3 downto 0) := "0000");
end top_11;

architecture Behavioral of top_11 is
    signal init : STD_LOGIC_VECTOR (12 downto 0) := "1111100110101";
    signal reg : STD_LOGIC_VECTOR (12 downto 0) := "1111100110101";
    signal rnd_reg : STD_LOGIC_VECTOR (12 downto 0) := "1111100110101"; -- validate this!
    signal rnd : STD_LOGIC := '0';
begin
    REG_CONTROL : process(clk)
    begin
        if (rising_edge(clk))
        then
            if (push_one = '1')
            then
                reg <= reg(11 downto 0) & '1';
            elsif (push_zero = '1')
            then
                reg <= reg(11 downto 0) & '0';
            elsif (push_cyclic = '1')
            then
                reg <= reg(11 downto 0) & reg(12);
            elsif (push_random = '1')
            then
                reg <= reg(11 downto 0) & rnd;
            end if;
        end if;
    end process REG_CONTROL;
    
    RANDOM_GEN : process(clk)
    variable temp : STD_LOGIC := '0';
    begin
        temp := rnd_reg(11) xor rnd_reg(10) xor rnd_reg(9) xor rnd_reg(1); -- validate this!
        rnd_reg <= rnd_reg(11 downto 0) & temp;
        rnd <= rnd_reg(12);
    end process RANDOM_GEN;
    
    COUNT_MATCHES : process (clk)
        variable tmp : STD_LOGIC_VECTOR (12 downto 0) := (others => '0');
        variable count : UNSIGNED (3 downto 0) := "0000";
    begin
        if (rising_edge(clk)) -- can catch a signal from REG_CONTROL to launch instead
        then
            tmp := not (reg xor init);
            for i in 0 to 12 loop
             count := count + ("000" & tmp(i));
            end loop;
            Q <= std_logic_vector(count);
            test <= tmp;
            count := "0000";
        end if;
    end process COUNT_MATCHES;
end Behavioral;
