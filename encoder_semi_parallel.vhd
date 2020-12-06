LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY encoder_semi_parallel IS
  PORT (nRst, clk:   IN STD_LOGIC;
        a:           IN STD_LOGIC;
        r, ended:   OUT STD_LOGIC);
END encoder_semi_parallel;

ARCHITECTURE structure OF encoder_semi_parallel IS

    signal a_index:       std_logic_vector(3 downto 0);
    signal selected_as: std_logic_vector(7 downto 0);

  COMPONENT ai_divider
    PORT (  nrst:        in std_logic;
            index:       in std_logic_vector(3 downto 0);
            ai:          in std_logic;
            a_relevance: out std_logic_vector(7 downto 0));
  END COMPONENT;

  COMPONENT xfo
    PORT (   nrst, clk: IN STD_LOGIC;
                    a:  IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    rn:  OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
  END COMPONENT;

  COMPONENT reverse_counter_15_0
    PORT (  clk:    IN STD_LOGIC;
            nrst:   IN STD_LOGIC;
            count: OUT STD_LOGIC_VECTOR(3 downto 0));
  END COMPONENT;

  COMPONENT gateNOr4
    PORT (  x1, x2, x3, x4:  IN STD_LOGIC;
            y:               OUT STD_LOGIC);
  END COMPONENT;

BEGIN

  counter: reverse_counter_15_0 PORT MAP (clk, nRst, a_index);
  ai_div : ai_divider PORT MAP(nRst, a_index, a, selected_as);
  xors   : xfo PORT MAP(nRst, clk, selected_as, r);
  final  : gateNOr4 PORT MAP(a_index(0), a_index(1), a_index(2), a_index(3), ended);
  
END structure;