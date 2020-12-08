LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY reverse_counter_7_0 IS
  PORT (clk: IN STD_LOGIC;
        nRst: IN STD_LOGIC;
        count: OUT STD_LOGIC_VECTOR(2 downto 0));
END reverse_counter_7_0;

ARCHITECTURE behavior OF reverse_counter_7_0 IS

	signal s_count: unsigned(2 downto 0); 

BEGIN
  PROCESS (clk, nRst)
  BEGIN
    IF (nRst = '0')
        THEN s_count <= "111";
        ELSIF (clk = '1') AND (clk'EVENT) THEN
				if(s_count = "000")
            THEN s_count <= s_count;
					else
					s_count <= s_count - 1;
				END IF;
	 END IF;
  END PROCESS;
  
  count <= std_logic_vector(s_count);
  
END behavior;