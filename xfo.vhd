LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY xfo IS
  PORT (nRst, clk: IN STD_LOGIC;
        a:  IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        r:  OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END xfo;

ARCHITECTURE structure OF xfo IS
  COMPONENT flipflopT
    PORT (T, clk: IN STD_LOGIC;
          nrst: IN STD_LOGIC;
          s: OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  fft1: flipflopT PORT MAP (a(7), clk, nRst, r(7));
  fft2: flipflopT PORT MAP (a(6), clk, nRst, r(6));
  fft3: flipflopT PORT MAP (a(5), clk, nRst, r(5));
  fft4: flipflopT PORT MAP (a(4), clk, nRst, r(4));
  fft5: flipflopT PORT MAP (a(3), clk, nRst, r(3));
  fft6: flipflopT PORT MAP (a(2), clk, nRst, r(2));
  fft7: flipflopT PORT MAP (a(1), clk, nRst, r(1));
  fft8: flipflopT PORT MAP (a(0), clk, nRst, r(0));
  
END structure;