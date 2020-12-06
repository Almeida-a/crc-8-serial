LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reverse_counter_15_0 IS
  PORT (clk: IN STD_LOGIC;
        nRst: IN STD_LOGIC;
        count: OUT STD_LOGIC_VECTOR(3 downto 0));
END reverse_counter_15_0;

ARCHITECTURE behavior OF reverse_counter_15_0 IS
BEGIN
  PROCESS (clk, nRst)
  BEGIN
    IF (nRst = '0')
        THEN count <= "1111";
        ELSIF (clk = '1') AND (clk'EVENT)
            THEN count <= count - 1;

	 END IF;
  END PROCESS;
END behavior;
