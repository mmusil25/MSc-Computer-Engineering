
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TickGenerator is
	port(
		clk_50mhz: in std_logic;
		tick_out: out std_logic
		);
end entity;

architecture arch of TickGenerator is

signal count: integer:= 1;
signal tmp: std_logic := '0';

begin

process(clk_50mhz)
begin

if (clk_50mhz'event and clk_50mhz = '1') then
	count <= count + 1;
	if (count = 25000000) then
		tmp <= NOT tmp;
		count <= 1;
	end if;
	tick_out <= tmp;
end if;
end process;
end arch;