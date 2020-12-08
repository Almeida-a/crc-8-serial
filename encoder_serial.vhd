LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY encoder_serial IS
  PORT (clk, nGRst: in std_logic;
        ain:          in std_logic;
        ar, ended:        out std_logic);
END encoder_serial;

ARCHITECTURE structure OF encoder_serial IS

    signal rparallel     : std_logic_vector(7 downto 0);
    signal s_r: std_logic;
	 signal s_ended : std_logic := '0';

  COMPONENT encoder_semi_parallel
    PORT (  nRst, clk:  IN STD_LOGIC;
            a:          IN STD_LOGIC;
            r:			OUT STD_LOGIC_VECTOR(7 downto 0);  
				ended:  OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT rserializer
    PORT (  nRst, clk:  IN STD_LOGIC;
            rpar:          IN STD_LOGIC_VECTOR(7 downto 0);
            rser:          OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT mux2to1
    PORT (  s:   IN STD_LOGIC;
            a, b:IN STD_LOGIC;
            o:  OUT STD_LOGIC);
  END COMPONENT;

begin

    semi_parallel: encoder_semi_parallel PORT MAP(nRst=>nGRst, clk=>clk, a=>ain, r=>rparallel, ended=>s_ended);
    serializer:              rserializer PORT MAP(nRst=>s_ended, clk=>clk, rpar=>rparallel, rser=>s_r);
    final:                       mux2to1 PORT MAP(s=>s_ended, a=>ain, b=>s_r, o=>ar);
	 ended <= s_ended;

END structure;