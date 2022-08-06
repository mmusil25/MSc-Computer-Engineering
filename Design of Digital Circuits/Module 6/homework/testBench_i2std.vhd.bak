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
			if ((val/(2**i)) mod 2 = 1) then
				result(i) := '1';
			end if
		end loop
	return (result);
	end i2std;
-- Declare signals which will hold the resultant std_logic_vector

constant my_width : integer := 8;

signal varStorage std_logic_vector;

begin
	varStorage <= i2std(0, my_width), '1' after 20ns, '2' after 40 ns, '3' after 60 ns;
	

end
	
	