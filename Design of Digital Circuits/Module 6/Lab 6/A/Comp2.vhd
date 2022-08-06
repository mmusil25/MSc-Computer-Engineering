---------------------------------
-- Entity Declaration --
---------------------------------
-- here we describe the I/O of the design
entity Comp2 is
	port(
		a, b : in bit;
		c : out bit
		);
end entity;
----------------------------------
-- Architecture Definition --
----------------------------------
-- here we put the description code of the design
architecture gate of Comp2 is
begin
	c <= NOT(a OR b);
end gate;
