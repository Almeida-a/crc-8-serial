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

    signal s_en is std_logic_vector(7 downto 0);

    component gateAnd2
        port(   x1: in std_logic;
                x2: in std_logic;
                y: out std_logic);
    end component;

    component selector
        port(count:     in  std_logic_vector(3 downto 0);
             a_enabler: out std_logic_vector(7 downto 0));
    end component;

begin

    sel: selector port map(index, s_en);
    r7: gateAnd2 port map(ai, s_en(7), a_relevance(7));
    r6: gateAnd2 port map(ai, s_en(6), a_relevance(6));
    r5: gateAnd2 port map(ai, s_en(5), a_relevance(5));
    r4: gateAnd2 port map(ai, s_en(4), a_relevance(4));
    r3: gateAnd2 port map(ai, s_en(3), a_relevance(3));
    r2: gateAnd2 port map(ai, s_en(2), a_relevance(2));
    r1: gateAnd2 port map(ai, s_en(1), a_relevance(1));
    r0: gateAnd2 port map(ai, s_en(0), a_relevance(0));

end structural ;