LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipFlopT IS
  PORT (clk, T: IN STD_LOGIC;
        nRst: IN STD_LOGIC;
        Q: OUT STD_LOGIC);
END flipFlopT;

ARCHITECTURE behavior OF flipFlopT IS
BEGIN
  PROCESS (clk, nRst)
  BEGIN
    IF (nRst = '0')
	    THEN Q <= '0';
		 ELSIF (clk = '1') AND (clk'EVENT)
	                THEN Q <= T xor Q;

	 END IF;
  END PROCESS;
END behavior;
