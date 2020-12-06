LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY selector IS
  PORT (count:      in std_logic_vector(3 downto 0);
        a_enabler: out std_logic_vector(7 downto 0));
END selector;

architecture structural of selector is

    signal r0as, r1as, r2as, r3as, r4as, r5as, r6as, r7as: std_logic_vector(7 downto 0);

    component decoder3to8
        port(x:  in STD_LOGIC_VECTOR (2 DOWNTO 0);
             y:  out STD_LOGIC_VECTOR (7 DOWNTO 0);
             en: in std_logic);
    end component;

    component mux16to1
        port(
            s: in std_logic_vector(3 downto 0);
            i: in std_logic_vector(15 downto 0);
            o: out std_logic
        );
    end component;

begin

    r7as <= "0010101111110010";
    r6as <= "0101011111100100";
    r5as <= "1010111111001000";
    r4as <= "0111010001100010";
    r3as <= "1110100011000100";
    r2as <= "1111101001111011";
    r1as <= "1101111100000101";
    r0as <= "1001010111111001";

    r0a_en : mux16to1 port map(counter, r0as, a_enabler(0));
    r1a_en : mux16to1 port map(counter, r1as, a_enabler(1));
    r2a_en : mux16to1 port map(counter, r2as, a_enabler(2));
    r3a_en : mux16to1 port map(counter, r3as, a_enabler(3));
    r4a_en : mux16to1 port map(counter, r4as, a_enabler(4));
    r5a_en : mux16to1 port map(counter, r5as, a_enabler(5));
    r6a_en : mux16to1 port map(counter, r6as, a_enabler(6));
    r7a_en : mux16to1 port map(counter, r7as, a_enabler(7));

    -- Another way: try something like a_enabler(x) = rxas(count)

end structural ;