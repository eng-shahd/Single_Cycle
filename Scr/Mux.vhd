library ieee;
use ieee.std_logic_1164.all;

entity Mux is
  port( 
 		 input1 : in std_logic_vector(31 downto 0 );
 		 input2 : in std_logic_vector(31 downto 0 ); 
		 mux_select : in std_logic;
 		 output : out std_logic_vector(31 downto 0 ) );
end entity;					

architecture Behavior of Mux is
begin
	with mux_select select
		output <= input1 when '0',
		          input2 when others;
end architecture ;
