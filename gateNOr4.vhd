LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY gateNOr4 IS
  PORT (x1, x2, x3, x4:  IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        y:              OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END gateNOr4;

architecture behavior of gateNOr4 is

begin

    y <= not x1 and not x2 and not x3 and not x4;

end behavior;
