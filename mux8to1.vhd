LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mux8to1 IS
  PORT (s:  IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        i:  IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        o:  OUT STD_LOGIC);
END mux8to1;

architecture behavior of mux8to1 is
begin
    process(x)
    begin
        case( s ) is
        
            when "000" => o <= i(0);
            when "001" => o <= i(1);
            when "010" => o <= i(2);
            when "011" => o <= i(3);
            when "100" => o <= i(4);
            when "101" => o <= i(5);
            when "110" => o <= i(6);
            when "111" => o <= i(7);
            when others => y <= "Z";
        
        end case ;
    end process;
end behavior;
