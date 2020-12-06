LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY checker_serial IS
  PORT (clk, nGRst: in std_logic;
        ar:          in std_logic;
        erro:        out std_logic);
END checker_serial;

ARCHITECTURE structure OF checker_serial IS

    signal s_ended: std_logic := '0';
    signal s_r1, s_r2: std_logic;
    signal s_rpar : std_logic_vector(7 downto 0);

  COMPONENT encoder_semi_parallel
    PORT (  nRst, clk:  IN STD_LOGIC;
            a:          IN STD_LOGIC;
            r, ended:  OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT exploder
    PORT (  nrst:     IN STD_LOGIC;
            x1:       IN STD_LOGIC_VECTOR(7 downto 0);
            x2:       IN STD_LOGIC;
            blown:   OUT STD_LOGIC);
  END COMPONENT;
  
  COMPONENT mux8to1 IS
  PORT (s:  IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        i:  IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        o:  OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT reverse_counter_7_0
    PORT (  clk:    IN STD_LOGIC;
            nrst:   IN STD_LOGIC;
            count: OUT STD_LOGIC_VECTOR(2 downto 0));
  END COMPONENT;

  COMPONENT gateAnd2
    PORT(x1, x2: in std_logic;
         y:     out std_logic);
  END COMPONENT;

begin

    esp: encoder_semi_parallel PORT MAP(nGRst, clk, s_a, s_rpar, s_ended);
    sub: reverse_counter_7_0 PORT MAP(clk, s_ended, s_count);
    and1: gateAnd2 PORT MAP(ar, not s_ended, s_a);
    and2: gateAnd2 PORT MAP(s_ended, ar, s_r1);
    mux: mux8to1 PORT MAP(s_count, s_rpar, s_r2);
    detector: exploder PORT MAP(nGRst, s_r1, s_r2, erro);

END structure;