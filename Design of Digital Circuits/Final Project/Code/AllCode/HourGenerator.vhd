library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HourGenerator is
	port (
		hour_in: in std_logic;
		hour: out std_logic_vector(5 downto 0)
		);
end entity;

architecture arch of HourGenerator is

signal hour_count: std_logic_vector(5 downto 0) := (others => '0');

begin

process(hour_in)

begin

if (hour_in'event and hour_in = '1') then

	hour <= hour_count;
	
	if (to_integer(unsigned(hour_count)) = 60) then
		hour_count <= (others => '0');
		
	else
		hour_count <= std_logic_vector(unsigned(hour_count) + 1);
	end if;
end if;
end process;
end arch;
