library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port ( OpCode : in  STD_LOGIC_VECTOR (5 downto 0);
           Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           MemtoReg : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           AluSrc : out  STD_LOGIC;
           RegDst : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           Jump : out STD_LOGIC;
           AluCtrl : out  STD_LOGIC_VECTOR (3 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is
    COMPONENT MainDecoder
    PORT(
        opcode : IN std_logic_vector(5 downto 0);          
        RegWrite : OUT std_logic;
        RegDst : OUT std_logic;
        ALUSrc : OUT std_logic;
        Branch : OUT std_logic;
        MemWrite : OUT std_logic;
        MemtoReg : OUT std_logic;
        ALUOp : OUT std_logic_vector(1 downto 0);
        Jump : OUT std_logic
        );
    END COMPONENT;
    
    COMPONENT ALUdecoder
    PORT(
        ALUop : IN std_logic_vector(1 downto 0);
        funct : IN std_logic_vector(5 downto 0);
        OpCode : IN std_logic_vector(5 downto 0);
        ALUctrl : OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;

    signal opalu: std_logic_vector(1 downto 0);

begin

    Inst_MainDecoder: MainDecoder PORT MAP(
        opcode => OpCode,
        RegWrite => RegWrite,
        RegDst => RegDst,
        ALUSrc => AluSrc,
        Branch => Branch,
        MemWrite => MemWrite,
        MemtoReg => MemtoReg,
        ALUOp => opalu,
        Jump => Jump
    );

    Inst_ALUdecoder: ALUdecoder PORT MAP(
        ALUop => opalu,
        funct => Funct,
        OpCode => OpCode,
        ALUctrl => AluCtrl
    );
    
end Behavioral;
