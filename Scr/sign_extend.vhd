library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SignExtend is
  port( 
        input  : in std_logic_vector(15 downto 0);

        output : out std_logic_vector(31 downto 0) );
end entity;			 
architecture Behavioral of SignExtend is
begin

 output <= "0000000000000000" & input when (input(15) = '0') else
           "1111111111111111" & input;

end architecture;
