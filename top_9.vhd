----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.10.2018 12:13:51
-- Design Name: 
-- Module Name: top_9 - Behavioral
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

-- One shot/ Monostable MV
entity top_9 is
    GENERIC ( DURATION : NATURAL RANGE 1 TO 100000 := 1);
    Port ( clk : in STD_LOGIC;
           trg : in STD_LOGIC;
           Q   : out STD_LOGIC := '0');
end top_9;

architecture Behavioral of top_9 is
-- make a FSM?
begin
    process (clk, trg)
      variable T : INTEGER RANGE 0 TO 100000 := 0;  
      variable trgd : BOOLEAN := FALSE;
    begin
      if (trg = '1' and not TRGD)
      then
        TRGD := TRUE;
      end if;
      if (rising_edge(clk) and TRGD)
      then
        if (T >= DURATION)
        then
           Q <= '0';
           TRGD := FALSE; -- goes to 0 unconditionally
           T := 0; 
        -- Don't go to 0 when trg is held 1           
--                if (trg = '0')
--                then
--                TRGD := FALSE;
--                end if;
           
        else
           T := T + 1;
           Q <= '1';
        end if;
      end if;
    end process;

end Behavioral;
