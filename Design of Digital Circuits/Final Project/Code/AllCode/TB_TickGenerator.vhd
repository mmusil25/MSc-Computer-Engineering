library ieee;
use ieee.std_logic_1164.all;

entity TB_TickGenerator is
end entity;

architecture behavioral of TB_TickGenerator is

signal TB_clock: std_logic := '0';
signal TB_clock_out: std_logic;

component TickGenerator port (
	clk_50mhz: in std_logic;
	tick_out: out std_logic
	);
end component;

begin

	DUT: TickGenerator port map(
		clk_50mhz => TB_clock,
		tick_out => TB_clock_out);
		
	clock_process: process
	
	begin
		TB_clock <= '0';
		wait for 10 ns;
		TB_clock <= '1';
		wait for 10 ns;
	end process;
	
end behavioral;

	