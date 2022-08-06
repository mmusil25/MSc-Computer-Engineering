---------------------------------
-- Entity Declaration --
---------------------------------
-- here we describe the I/O of the design
entity AOI is
port(
	i1, i2, i3, i4 : in bit;
	z : out bit
	);
end entity;
----------------------------------
-- Architecture Definition --
----------------------------------
-- here we put the description code of the design
architecture structural of AOI is
signal temp1, temp2 : bit; -- these are (internal) signals that carry outputs from 2 Comp1 components to the inputs of the Comp2 component

component comp1 port(a, b : in bit; c : out bit); end component; -- declaration of Comp1 (written on a single line)
component comp2 port(a, b : in bit; c : out bit); end component; -- declaration of Comp2 (written on a single line)

begin
MyAND1: Comp1
	port map(a => i1, b => i2, c => temp1);
MyAND2: Comp1
	port map(a => i3, b => i4, c => temp2);
MyORINVERT: Comp2
	port map(temp1, temp2, z);
end structural;



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