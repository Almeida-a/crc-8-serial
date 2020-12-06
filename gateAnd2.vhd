LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateAnd2 IS
  PORT (x1, x2: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END gateAnd2;

ARCHITECTURE behavior OF gateAnd2 IS
BEGIN

    y <= x1 and x2;

END behavior;
