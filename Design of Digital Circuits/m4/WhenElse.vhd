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

architecture WhenElse of 4bitComp is
begin 
	equals <= '1' when (A = B) else '0';
	altb <= '1'   when (A < B) else '0';
	blta <= '1'   when (A > B) else '0';
end WhenElse 