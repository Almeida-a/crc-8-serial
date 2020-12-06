LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY encoder_serial IS
  PORT (clk, nGRst: in std_logic;
        a:          in std_logic;
        ar:        out std_logic);
END encoder_serial;

ARCHITECTURE structure OF encoder_serial IS

    signal rparallel     : std_logic_vector(3 downto 0);
    signal s_ended, s_r  : std_logic;

  COMPONENT encoder_semi_parallel
    PORT (  nRst, clk:  IN STD_LOGIC;
            a:          IN STD_LOGIC;
            r, ended:  OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT rserializer
    PORT (  nRst, clk:  IN STD_LOGIC;
            rn:          IN STD_LOGIC_VECTOR(7 downto 0);
            r:          OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT mux2to1
    PORT (  s:   IN STD_LOGIC;
            a, b:IN STD_LOGIC;
            r:  OUT STD_LOGIC);
  END COMPONENT;

begin

    semi_parallel: encoder_semi_parallel PORT MAP(nGRst, clk, a, rparallel, s_ended);
    serializer:              rserializer PORT MAP(nGRst, clk, rparallel, s_r);
    final:                       mux2to1 PORT MAP(s_ended, a, s_r, ar);

END structure;