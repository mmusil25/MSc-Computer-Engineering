---------------------------------
-- Entity Declaration --
---------------------------------
-- here we describe the I/O of the design
entity Comp1 is
port(
	a, b : in bit;
	c : out bit
	);
end entity;

----------------------------------
-- Architecture Definition --
----------------------------------
-- here we put the description code of the design
architecture gate of Comp1 is
begin
	c <= a AND b;

end gate;