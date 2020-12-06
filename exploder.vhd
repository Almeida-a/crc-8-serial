LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY exploder IS
  PORT (clk, T: IN STD_LOGIC;
        x1, x2: IN STD_LOGIC;
        blown: OUT STD_LOGIC);
END exploder;

ARCHITECTURE behavior OF exploder IS
BEGIN
  PROCESS (clk, nRst, x1, x2)
  BEGIN
    IF (nRst = '0')
	    THEN blown <= '0';
         ELSIF (clk = '1') AND (clk'EVENT) THEN 
            IF(blown = '1' or (x1 xor x2)) THEN -- x1 != x2
                blown <= '1';
                elsif (x1 xnor x2) then -- x1 == x2
                    blown <= 0;
            END IF;
	 END IF;
  END PROCESS;
END behavior;
