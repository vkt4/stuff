----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2018 13:12:15
-- Design Name: 
-- Module Name: top_6 - Behavioral
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

-- M-seqs
entity top_6 is
    GENERIC (M : NATURAL range 3 to 12 := 4;
             P : STD_LOGIC_VECTOR (12 downto 0) := "0000000001100");--(others => '0')); 
    Port ( clk : in STD_LOGIC;
           Q : out STD_LOGIC);
          -- Qtot : out STD_LOGIC_VECTOR(M-1 downto 0));
end top_6;

architecture Behavioral of top_6 is

signal S : STD_LOGIC_VECTOR ( M downto 0) := (0 => '1', others => '0');
signal A : STD_LOGIC_VECTOR ( M downto 0) := (others => '0');
--signal B : STD_LOGIC := '0';
begin

    outer_gen : FOR I in 0 to M-1 GENERATE
            A(I+1) <= A(I) xor (S(I) and P(I));
    END GENERATE outer_gen;
    --B <= S(2) xor S(3);
    S <= S(M-1 downto 0) & A(M) when rising_edge(clk);
    --S <= S(M-1 downto 0) & B when rising_edge(clk);
    Q <= S(M);
    --Qtot <= S;

end Behavioral;
