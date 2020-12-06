LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mux16to1 IS
  PORT (s:  IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        i:  IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        o:  OUT STD_LOGIC);
END mux16to1;

architecture behavior of mux16to1 is
begin
    process(s)
    begin
        case( s ) is
        
            when "0000" => o <= i(0);
            when "0001" => o <= i(1);
            when "0010" => o <= i(2);
            when "0011" => o <= i(3);
            when "0100" => o <= i(4);
            when "0101" => o <= i(5);
            when "0110" => o <= i(6);
            when "0111" => o <= i(7);
            when "1000" => o <= i(8);
            when "1001" => o <= i(9);
            when "1010" => o <= i(10);
            when "1011" => o <= i(11);
            when "1100" => o <= i(12);
            when "1101" => o <= i(13);
            when "1110" => o <= i(14);
            when "1111" => o <= i(15);
            when others => y <= "Z";
        
        end case ;
    end process;
end behavior;
