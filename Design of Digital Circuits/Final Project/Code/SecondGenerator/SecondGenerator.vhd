library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SecondGenerator is
	port (
		tick_in: in std_logic;
		minute_out: out std_logic;
		second: out std_logic_vector(5 downto 0)
		);
end entity;

architecture arch of SecondGenerator is 

signal second_count: std_logic_vector(5 downto 0) := (others => '0');
signal minute_out_tmp: std_logic := '0';

begin 

process(tick_in)

begin

if (tick_in'event and tick_in = '1') then

	second <= second_count;
	minute_out <= minute_out_tmp;
	
	if(to_integer(unsigned(second_count)) = 60) then
		second_count <= (others => '0');
		minute_out_tmp <= NOT minute_out_tmp;
	else
		second_count <= std_logic_vector(unsigned(second_count) + 1);
	end if;
end if;
end process;
end arch;
	