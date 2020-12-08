LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY gateOr3 IS
  PORT (x0, x1, x2:  IN STD_LOGIC;
        y:          OUT STD_LOGIC);
END gateOr3;

architecture behavior of gateOr3 is

begin

	 y <= x0 or x1 or x2;

end behavior;
