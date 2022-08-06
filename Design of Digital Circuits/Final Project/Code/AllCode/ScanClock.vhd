library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ScanClock is
	port(
		clk_50mhz: in std_logic;
		scan_out: out std_logic
		);
end entity;

architecture arch of ScanClock is

signal count : integer := 1;
signal tmp: std_logic := '0';

begin 

process(clk_50mhz)
begin

if (clk_50mhz'event and clk_50mhz = '1') then 
	count <= count + 1;
	if (count = 100000) then 
		tmp <= NOT tmp;
		count <= 1;
	end if;
	scan_out <= tmp;
end if;
end process;
end arch;

