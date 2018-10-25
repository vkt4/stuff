----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2018 11:27:25
-- Design Name: 
-- Module Name: top_7 - Behavioral
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

entity top_7 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           add_sub : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end top_7;
--add-sub on logic : unsigned numers in - signed out
architecture Behavioral of top_7 is
--signal c1, c2 : STD_LOGIC := '0';
begin
    process (clk)
    variable c1, c2 : STD_LOGIC := '0';
    begin
        if (rising_edge(clk))
        then
           if (add_sub = '0')
           then
            --addition a + b
            Q(0) <= a(0) xor b(0);
            c1 := a(0) and b(0);    -- carry 1
            Q(1) <= a(1) xor b(1) xor c1;               --(a(0) and (b(0))); 
            Q(2) <= (a(1) and b(1)) or ((a(1) xor b(1)) and c1); --(a(0) and b(0)));
            Q(3) <= '0';
           else
            --substraction a - b, two's complement
            Q(0) <= a(0) xor b(0);
            c1 := not a(0) and b(0); -- borrow 1
            Q(1) <= a(1) xor b(1) xor c1;
            c2 := (not a(1) and b(1)) or (not (a(1) xor b(1)) and c1); -- borrow 2
            Q(2) <= c2;
            Q(3) <= c2;  
           end if;
        end if;
    end process;

end Behavioral;
