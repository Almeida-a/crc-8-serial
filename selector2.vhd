LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY selector2 IS
  PORT (count:      in std_logic_vector(3 downto 0);
        a_enabler: out std_logic_vector(7 downto 0));
END selector2;

architecture behavior of selector2 is
    begin
        process(count)
        begin
            case( count ) is
            
                when "0000" => a_enabler <= "00101111";
                when "0001" => a_enabler <= "01011110";
                when "0010" => a_enabler <= "10111100";
                when "0011" => a_enabler <= "01010111";
                when "0100" => a_enabler <= "10101110";
                when "0101" => a_enabler <= "01110011";
                when "0110" => a_enabler <= "11100110";
                when "0111" => a_enabler <= "11100011";
                when "1000" => a_enabler <= "11101001";
                when "1001" => a_enabler <= "11111101";
                when "1010" => a_enabler <= "11010101";
                when "1011" => a_enabler <= "10000101";
                when "1100" => a_enabler <= "00100101";
                when "1101" => a_enabler <= "01001010";
                when "1110" => a_enabler <= "10010100";
                when "1111" => a_enabler <= "00000111";
                when others => a_enabler <= "00000000";
            
            end case ;
        end process;
    end behavior;