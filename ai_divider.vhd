LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ai_divider IS
  PORT (nRst:        in std_logic;
        index:       in std_logic_vector(3 downto 0);
        ai:          in std_logic;
        a_relevance: out std_logic_vector(7 downto 0));
END ai_divider;

architecture structural of ai_divider is

    signal s_en: std_logic_vector(7 downto 0);
	 signal s_ai: std_logic;

    component gateAnd2
        port(   x1: in std_logic;
                x2: in std_logic;
                y: out std_logic);
    end component;

    component selector2
        port(count:     in  std_logic_vector(3 downto 0);
             a_enabler: out std_logic_vector(7 downto 0));
    end component;

begin

    sel: selector2 port map(count=>index, a_enabler=>s_en);
	 nr: gateAnd2 port map(x1=>ai, x2=>nRst, y=>s_ai);
    r7: gateAnd2 port map(x1=>s_ai, x2=>s_en(7), y=>a_relevance(7));
    r6: gateAnd2 port map(x1=>s_ai, x2=>s_en(6), y=>a_relevance(6));
    r5: gateAnd2 port map(x1=>s_ai, x2=>s_en(5), y=>a_relevance(5));
    r4: gateAnd2 port map(x1=>s_ai, x2=>s_en(4), y=>a_relevance(4));
    r3: gateAnd2 port map(x1=>s_ai, x2=>s_en(3), y=>a_relevance(3));
    r2: gateAnd2 port map(x1=>s_ai, x2=>s_en(2), y=>a_relevance(2));
    r1: gateAnd2 port map(x1=>s_ai, x2=>s_en(1), y=>a_relevance(1));
    r0: gateAnd2 port map(x1=>s_ai, x2=>s_en(0), y=>a_relevance(0));

end structural ;