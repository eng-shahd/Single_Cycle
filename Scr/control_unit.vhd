library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port(
        opcode    : in  STD_LOGIC_VECTOR(5 downto 0);
        RegDst    : out STD_LOGIC;
        ALUSrc    : out STD_LOGIC;
        MemtoReg  : out STD_LOGIC;
        RegWrite  : out STD_LOGIC;
        MemRead   : out STD_LOGIC;
        MemWrite  : out STD_LOGIC;
        Branch    : out STD_LOGIC;
        ALUOp     : out STD_LOGIC_VECTOR(1 downto 0)
    );
end control_unit;

architecture Behavioral of control_unit is
begin

    process(opcode)
    begin
        RegDst   <= '0';
        ALUSrc   <= '0';
        MemtoReg <= '0';
        RegWrite <= '0';
        MemRead  <= '0';
        MemWrite <= '0';
        Branch   <= '0';
        ALUOp    <= "00";

        case opcode is
        
            when "000000" =>
                RegDst   <= '1';
                ALUSrc   <= '0';
                MemtoReg <= '0';
                RegWrite <= '1';
                MemRead  <= '0';
                MemWrite <= '0';
                Branch   <= '0';
                ALUOp    <= "10";

            when "100011" =>
                RegDst   <= '0';
                ALUSrc   <= '1';
                MemtoReg <= '1';
                RegWrite <= '1';
                MemRead  <= '1';
                MemWrite <= '0';
                Branch   <= '0';
                ALUOp    <= "00";

            when "101011" =>
                RegDst   <= '0';
                ALUSrc   <= '1';
                MemtoReg <= '0';
                RegWrite <= '0';
                MemRead  <= '0';
                MemWrite <= '1';
                Branch   <= '0';
                ALUOp    <= "00";

            when "000100" =>
                RegDst   <= '0';
                ALUSrc   <= '0';
                MemtoReg <= '0';
                RegWrite <= '0';
                MemRead  <= '0';
                MemWrite <= '0';
                Branch   <= '1';
                ALUOp    <= "01";

            when others =>
                null;
        end case;
    end process;

end Behavioral;

