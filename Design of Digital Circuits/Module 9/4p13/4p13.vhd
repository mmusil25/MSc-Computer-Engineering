library ieee;
use ieee.std_logic_1164.all;

entity my_entity is 
port (
	a: in std_logic;
	b: in std_logic;
	c: in std_logic;
	clk: in std_logic;
	q: out std_logic
	); end my_entity;

architecture has_errors of my_entity is

 begin

	p1: process(clk)

		begin
			if clk='1' then
				q <= ((a or b) and c);
			end if;
	end process p1;
	
end has_errors;



/*
begin

	p1: process 

		begin
			if (clk'event and clk='1') then
				q <= ((a or b) and c);
			end if;
	end process p1;
	
end has_errors;
*/
 
 
