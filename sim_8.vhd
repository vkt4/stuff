----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2018 14:20:29
-- Design Name: 
-- Module Name: sim_8 - Behavioral
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

entity sim_8 is
--  Port ( );
end sim_8;

architecture Behavioral of sim_8 is

signal clk, push_one, push_zero, push_cyclic, push_random : STD_LOGIC := '0';
signal Q : STD_LOGIC_VECTOR (3 downto 0);
signal test : STD_LOGIC_VECTOR (12 downto 0);

component top_11 is
    Port ( clk : in STD_LOGIC;
           push_one : in STD_LOGIC;
           push_zero : in STD_LOGIC;
           push_cyclic : in STD_LOGIC;
           push_random : in STD_LOGIC;
           test : out STD_LOGIC_VECTOR (12 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin
    correlator : top_11 port map
    (
        clk => clk,
        push_one => push_one,
        push_zero => push_zero,
        push_cyclic => push_cyclic,
        push_random => push_random,
        test => test,
        Q => Q
    );


    CLOCKER : process
        constant period : time := 10 ns;
        begin
            wait for period;
            clk <= not clk;
    end process CLOCKER;
    
    STIM : process
        constant period : time := 20 ns;
        begin
            wait for period * 3;
            for i in 0 to 13
            loop -- roll
                push_cyclic <= '1';
                wait for period;
                push_cyclic <= '0';
                wait for period;
            end loop;
            for i in 0 to 20
            loop -- fill w/random and roll
                push_random <= '1';
                wait for period;
                push_random <= '0';
                wait for period;
                for i in 0 to 13
                loop -- roll
                    push_cyclic <= '1';
                    wait for period;
                    push_cyclic <= '0';
                    wait for period;
                end loop;
            end loop;
            -- fill with barker
            push_one <= '1';
            wait for period*5;
            push_one <= '0';
            push_zero <= '1';
            wait for period*2;
            push_one <= '1';
            push_zero <= '0';
            wait for period*2;
            push_one <= '0';
            push_zero <= '1';
            wait for period;
            push_one <= '1';
            push_zero <= '0';
            wait for period;
            push_one <= '0';
            push_zero <= '1';
            wait for period;
            push_one <= '1';
            push_zero <= '0';
            wait for period;
            push_one <= '0';
            for i in 0 to 13
            loop -- roll
                push_cyclic <= '1';
                wait for period;
                push_cyclic <= '0';
                wait for period;
            end loop;
        wait;
    end process STIM;

end Behavioral;
