LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY checker_serial IS
  PORT (clk, nGRst: in std_logic;
        ain:          in std_logic;
        erro:        out std_logic);
END checker_serial;

ARCHITECTURE structure OF checker_serial IS

		signal s_end, s_ar1: std_logic := '0';

		COMPONENT encoder_serial
		PORT (clk, nGRst: in std_logic;
        ain:          in std_logic;
        ar, ended:        out std_logic);
		END COMPONENT;
		
		COMPONENT exploder
		  PORT (nRst: IN STD_LOGIC;
				  x1, x2: IN STD_LOGIC;
				  blown: OUT STD_LOGIC);
			END COMPONENT;
					
begin

	encoder: encoder_serial port map(clk=>clk, nGRst=>nGRst, ain=>ain, ar=>s_ar1, ended=>s_end);
	alarm: exploder port map(nRst=>s_end, x1=>s_ar1, x2=>ain, blown=>erro);

END structure;