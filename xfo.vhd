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
    PORT (clk, T: IN STD_LOGIC;
          nrst: IN STD_LOGIC;
          Q: OUT STD_LOGIC);
  END COMPONENT;
BEGIN
  fft1: flipflopT PORT MAP (clk=>clk, T=>a(7), nrst=>nRst, Q=>r(7));
  fft2: flipflopT PORT MAP (clk=>clk, T=>a(6), nrst=>nRst, Q=>r(6));
  fft3: flipflopT PORT MAP (clk=>clk, T=>a(5), nrst=>nRst, Q=>r(5));
  fft4: flipflopT PORT MAP (clk=>clk, T=>a(4), nrst=>nRst, Q=>r(4));
  fft5: flipflopT PORT MAP (clk=>clk, T=>a(3), nrst=>nRst, Q=>r(3));
  fft6: flipflopT PORT MAP (clk=>clk, T=>a(2), nrst=>nRst, Q=>r(2));
  fft7: flipflopT PORT MAP (clk=>clk, T=>a(1), nrst=>nRst, Q=>r(1));
  fft8: flipflopT PORT MAP (clk=>clk, T=>a(0), nrst=>nRst, Q=>r(0));
  
END structure;