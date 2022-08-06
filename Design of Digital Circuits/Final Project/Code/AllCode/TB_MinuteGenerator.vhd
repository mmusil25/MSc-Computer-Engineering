library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_MinuteGenerator is
end entity;

architecture behavioral of TB_MinuteGenerator is

signal TB_minute_in: std_logic := '0';
signal TB_hour_out: std_logic;
signal TB_minute: std_logic_vector(5 downto 0);

component MinuteGenerator port(
	minute_in: in std_logic;
	hour_out: out std_logic;
	minute: out std_logic_vector(5 downto 0)
	);
end component;

begin

DUT: MinuteGenerator port map(
	minute_in => TB_minute_in, 
	hour_out => TB_hour_out,
	minute => TB_minute
	);
	
	minute_process: process
	
	begin
		TB_minute_in <= '0';
		wait for 60000 ms;
		TB_minute_in <= '1';
		wait for 60000 ms;
	end process;
end behavioral;