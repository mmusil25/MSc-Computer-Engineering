-- Practice by finding i2bv
-- i2bv: Integer to bit_vector
-- return: bit_vector, with left bit as the most significant bit\
package my_package is
	function i2bv (val, width: integer) return bit_vector is
		variable result: bit_vector(width-1 downto 0):= (others => '0');
	variable bits: integer:= width;
	begin
		for i in 0 to bits-1 loop
		if ((val/(2**i)) mod 2 = 1) then
			result(i) := '1';
		end if;
	end loop;
	return (result);
	end i2bv;
end my_package;