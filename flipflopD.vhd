LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipFlopD IS
  PORT (clk, D: IN STD_LOGIC;
        nSet, nRst: IN STD_LOGIC;
        Q: OUT STD_LOGIC);
END flipFlopD;

ARCHITECTURE behavior OF flipFlopD IS
BEGIN
  PROCESS (clk, nSet, nRst)
  BEGIN
    IF (nRst = '0')
        THEN Q <= '0';
        ELSIF (clk = '1') AND (clk'EVENT)
            THEN Q <= D;

	 END IF;
  END PROCESS;
END behavior;
