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
--https://www.electronicshub.org/digital-comparator-and-magnitude-comparator/
use work.gatespkg.all;
architecture ComponentInstaniation of 4bitComp is
	signal x : std_logic_vector(0 to 3);
	signal notA: std_logic_vector(0 to 1);
	signal notB: std_logic_vector(0 to 1);
	signal altbAnd: std_logic_vector(0 to 2);
	signal bltaAnd: std_logic_vector(0 to 2);
	
begin

	-- A and B are equal
	u0: xnor2 port map (A(0), B(0), x(0));
	u1: xnor2 port map (A(1), B(1), x(1));
	u2: xnor2 port map (A(2), B(2), x(2));
	u3: xnor2 port map (A(3), B(3), x(3));
	u4: and4  port map (x(0), x(1), x(2), x(3), equals);
	
	
	-- A less than B
	u5: not2  port map (A(0), notA(0));
	u6: not2 port map (A(1), notA(1));
	u7: not2 port map (B(1), notB(1));
	u8: and2 port map (notA(1), notB(1), altbAnd(0));
	u9: and3 port map (notA(0), B(1), B(0), altbAnd(1));
	u10: and3 port map (notA(1), notA(0), B(0), altbAnd(2));
	u11: or3 port map (altbAnd(0), altbAnd(1), altbAnd(2), altb);
	
	
	-- A greater than B
	u12: and2 port map (A(1), notB(1), bltaAnd(0));
	u13: not2 port map (B(0), notB(0));
	u14: and3 port map (A(0), notB(1), notB(0), bltaAnd(1));
	u15: and3 port map (A(1), A(0), notB(0), bltaAnd(2));
	u16: or3 port map (bltaAnd(0), bltaAnd(1), bltaAnd(2), blta);
	
end ComponentInstaniation


