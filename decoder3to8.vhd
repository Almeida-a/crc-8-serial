LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY decoder3to8 IS
  PORT (x:  IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        y:  OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        en: in std_logic);
END decoder3to8;

architecture behavior of decoder3to8 is
begin
    process(x, en)
    begin
        y <= "00000000";
        if (en = '1') then
            case x  is
            
                when "000" => y(0) <= '1';
                when "001" => y(1) <= '1';
                when "010" => y(2) <= '1';
                when "011" => y(3) <= '1';
                when "100" => y(4) <= '1';
                when "101" => y(5) <= '1';
                when "110" => y(6) <= '1';
                when "111" => y(7) <= '1';
                when others => y <= "00000000";
            
            end case ;
        end if ;
    end process;
end behavior;

