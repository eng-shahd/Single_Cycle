library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
use ieee.numeric_std.all;

entity data_memory is -- data memory
	port(clk, MemWrite, MemRead: in STD_LOGIC;
	address, write_data: in STD_LOGIC_VECTOR (31 downto 0);
	read_data: out STD_LOGIC_VECTOR (31 downto 0));
end;   

architecture behave of data_memory is
begin
process  is
	type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
	variable mem: ramtype;
	begin
	-- read or write memory
	for i in 1 to 1000 loop
		if rising_edge(clk) then
			if (MemWrite='1') then 
			mem (CONV_INTEGER('0'& address(7 downto 2))):= write_data;
			end if;
		
			if (MemRead='1') then 
			read_data <= mem (CONV_INTEGER('0'&address (7 downto 2)));
			end if;
		
		end if;
		wait on clk, address;
	end loop;
end process;
end;
