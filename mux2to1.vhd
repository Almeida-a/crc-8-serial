LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mux16to1 IS
  PORT (s:     IN STD_LOGIC;
        a, b:  IN STD_LOGIC;
        o:    OUT STD_LOGIC);
END mux16to1;

architecture behavior of mux16to1 is

begin
    process(s)
    begin
        if(s = '1') then
            o <= b;
        else
            o <= a;
        end if;
    end process;
end behavior;
