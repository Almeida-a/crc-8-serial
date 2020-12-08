LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipFlopT IS
  PORT (clk, T: IN STD_LOGIC;
        nRst: IN STD_LOGIC;
        Q: OUT STD_LOGIC);
END flipFlopT;

ARCHITECTURE behavior OF flipFlopT IS

	signal s_Q: std_logic;

BEGIN

  PROCESS (clk, nRst)
  BEGIN
    IF (nRst = '0')
	    THEN s_Q <= '0';
		 ELSIF (clk = '1') AND (clk'EVENT)
	                THEN
						 if T='0' then
							s_Q <= s_Q;
								elsif T='1' then
								s_Q <= not (s_Q);
						 end if;

	 END IF;
  END PROCESS;
  Q <= s_Q;
END behavior;
