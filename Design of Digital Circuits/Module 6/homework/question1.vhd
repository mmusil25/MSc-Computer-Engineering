-- i2std: Convert an integer to a std_logic_vector
-- in: integer
-- return: std_logic_vector with left bit as MSB

library ieee;
use ieee.std_logic_1164.all;

package conversion_package is
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
end conversion_package;


