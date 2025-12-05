library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALUControl is
  port(
    ALUOp      : in  std_logic_vector(1 downto 0);
    funct      : in  std_logic_vector(5 downto 0);
    ALUControl : out std_logic_vector(3 downto 0) );
end entity;

architecture Behavior of ALUControl is
begin

  process(ALUOp, funct)
  begin
    case ALUOp is

      -- LW, SW => ADD
      when "00" =>
        ALUControl <= "0010";

      -- BEQ => SUB
      when "01" =>
        ALUControl <= "0110";

      -- R-type
      when "10" =>
        case funct is
          when "100000" => ALUControl <= "0010"; -- ADD
          when "100010" => ALUControl <= "0110"; -- SUB
          when "100100" => ALUControl <= "0000"; -- AND
          when "100101" => ALUControl <= "0001"; -- OR
          when "101010" => ALUControl <= "0111"; -- SLT
          when others   => ALUControl <= "1111"; -- undefined
        end case;

      when others =>
        ALUControl <= "1111";

    end case;
  end process;

end architecture;
