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

architecture Boolean of 4bitComp is
begin
	equals <= 		not(A(0) xor B(0))
				and not(A(1) xor B(1))
				and not(A(2) xor B(2))
				and not(A(3) xor B(3));
end Boolean