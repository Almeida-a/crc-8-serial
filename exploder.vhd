LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY exploder IS
  PORT (nRst: IN STD_LOGIC;
        x1, x2: IN STD_LOGIC;
        blown: OUT STD_LOGIC);
END exploder;

ARCHITECTURE behavior OF exploder IS

	signal s_blown : std_logic;

BEGIN
  PROCESS (nRst, x1, x2)
  BEGIN
    IF (nRst = '0')
	    THEN s_blown <= '0';
         ELSE
            IF(s_blown = '1' or (x1 xor x2) = '1') THEN -- x1 != x2
                s_blown <= '1';
                elsif ((x1 xnor x2) = '1') then -- x1 == x2
                    s_blown <= '0';
            END IF;
	 END IF;
  END PROCESS;
  
  blown <= s_blown;
  
END behavior;
