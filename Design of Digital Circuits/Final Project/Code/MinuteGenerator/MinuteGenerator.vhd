library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MinuteGenerator is
	port (
		minute_in: in std_logic;
		hour_out: out std_logic;
		minute: out std_logic_vector(5 downto 0)
		);
end entity;

architecture arch of MinuteGenerator is

signal minute_count: std_logic_vector(5 downto 0) := (others => '0');
signal hour_out_tmp: std_logic := '0';

begin

process(minute_in)

begin

if (minute_in'event and minute_in = '1') then

	minute <= minute_count;
	hour_out <= hour_out_tmp;
	
	if (to_integer(unsigned(minute_count)) = 60) then
		minute_count <= (others => '0');
		hour_out_tmp <= NOT hour_out_tmp;
	else
		minute_count <= std_logic_vector(unsigned(minute_count) + 1);
	end if;
end if;
end process;
end arch;
