-- q1 test bench from scratch

library ieee;
use ieee.std_logic_1164.all;

entity testBench_i2std is
end entity;

architecture my_behavior of testBench_i2std is

-- Declare the function to be tested
function i2std (myInteger, width : integer) return std_logic_vector is
	variable result: std_logic_vector(width-1 downto 0):= (others => '0');
	variable bits: integer:= width;
	begin
		for i in 0 to bits-1 loop
			if ((myInteger/(2**i)) mod 2 = 1) then
				result(i) := '1';
			end if;
		end loop;
	return (result);
	end i2std;
-- Declare signals which will hold the resultant std_logic_vector

constant my_width : integer := 8;

signal varStorage : std_logic_vector(7 downto 0);

begin
	varStorage <= i2std(0, my_width), i2std(1, my_width) after 20ns, 
				  i2std(2, my_width) after 40 ns, i2std(4, my_width) after 60 ns,
				  i2std(5, my_width) after 80 ns, i2std(6, my_width) after 100 ns,
			      i2std(7, my_width) after 120 ns, i2std(8, my_width) after 140 ns,
				  i2std(9, my_width) after 160 ns, i2std(10, my_width) after 180 ns,
				  i2std(11, my_width) after 200 ns, i2std(12, my_width) after 220 ns;
end my_behavior;
	
	