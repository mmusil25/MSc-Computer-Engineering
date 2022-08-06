library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_HourGenerator is
end entity;

architecture behavioral of TB_HourGenerator is

signal TB_hour_in: std_logic := '0';
signal TB_hour: std_logic_vector(5 downto 0);

component HourGenerator port(
	hour_in: in std_logic;
	hour: out std_logic_vector(5 downto 0)
	);
end component;

begin

DUT: HourGenerator port map(
	hour_in => TB_hour_in,
	hour => TB_hour
	);
	
	hour_process: process
	begin
		TB_hour_in <= '0';
		wait for 10 ms;
		TB_hour_in <= '1';
		wait for 10 ms;
	end process;
end behavioral;


	