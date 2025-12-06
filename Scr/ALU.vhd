library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port(
	alu_op1	: in std_logic_vector(31 downto 0);	 
	alu_op2	: in std_logic_vector(31 downto 0);	
	ALUControl  : in std_logic_vector(3 downto 0); 	
	alu_result		: out std_logic_vector(31 downto 0); 
	zero		: out std_logic );		  
end entity;

architecture Behavior of ALU is		  
	signal temp : std_logic_vector(31 downto 0);
begin	  
	temp<=
		-- add
   		std_logic_vector(unsigned(alu_op1) + unsigned(alu_op2)) when ALUControl = "0000" else
		-- subtract
  	 	std_logic_vector(unsigned(alu_op1) - unsigned(alu_op2)) when ALUControl = "0001" else
    	-- AND
    	alu_op1 AND  alu_op2 when ALUControl = "0010" else
   		-- OR
  		alu_op1 OR   alu_op2 when ALUControl = "0011" else
    	-- NOR
  		alu_op1 NOR  alu_op2 when ALUControl = "0100" else
  		-- NAND
    	alu_op1 NAND alu_op2 when ALUControl = "0101" else
   		-- XOR
    	alu_op1 XOR  alu_op2 when ALUControl = "0110" else
    	-- shift left logical
    	std_logic_vector(shift_left(unsigned(alu_op1), to_integer(unsigned(alu_op2(10 downto 6))))) when ALUControl = "0111" else
    	-- shift right logical
    	std_logic_vector(shift_right(unsigned(alu_op1), to_integer(unsigned(alu_op2(10 downto 6))))) when ALUControl = "1000" else
    	(others => '0');
		
	zero <= '1' when (temp <= "00000000000000000000000000000000") else '0';
  	alu_result <= temp;

end architecture ;
