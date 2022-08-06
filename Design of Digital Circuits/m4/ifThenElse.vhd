library ieee;
use ieee.std_logic_1164.all;
entity 4bitComp is
	port (
		A: in bit_vector(3 downto 0);
		B: in bit_vector(3 downto 0);
		altb: out bit;
		blta: out bit;
		equals: out bit);
end 4bitComp

architecture IfThenElse of 4bitComp is
begin
	equals <= '0';
	altb <= '0';
	blta <= '0';
	
	comp: process(A, B)
		begin
			
			if A = B then
				equals <= '1';
			else
				equals <= '0'
			end if
			
			if A < B then
				altb <= '1';
			else
				altb <= '0';
			end if
			
			if A > B then
				blta <= '1';
			else
				blta <= '0';
			end if
			
	end process comp
end IfThenElse

				