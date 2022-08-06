-- Mark Musil
-- This file describes a D flip flop and runs a few tests on it. 

library ieee;
use ieee.std_logic_1164.all;

entity D_flip_flop_test_bench is
end entity;

architecture behavior of D_flip_flop_test_bench is

signal ext_d : std_logic := '1';
signal ext_q : std_logic;
signal ext_reset, ext_clk: std_logic := '0'; 

component D_FLIP_FLOP port(
							clk, d, synchronous_reset : in std_logic;
							q : out std_logic
							); end component;
	
begin 

--	ext_clk <= NOT(ext_clk) after 5 ns;
--	ext_d <= NOT(ext_d) after 30 ns;
--	ext_reset <= NOT(ext_reset) after 50 ns;

	DUT: D_FLIP_FLOP port map(
						clk => ext_clk, 
						d => ext_d, 
						synchronous_reset => ext_reset, 
						q => ext_q);
	
	clock_process: process
	begin
		ext_clk <= '0';
		wait for 5 ns;
		ext_clk <= '1';
		wait for 5 ns;
	end process;
	
	stimulus: process
	begin
		wait for 10 ns;
		ext_d <= '1';
		wait for 10 ns;
		ext_d <= '0';
		wait for 10 ns;
		ext_d <= '1';
		wait for 10 ns;
		ext_d <= '0';
		wait for 10 ns;
		ext_d <= '0';
		wait for 10 ns;
		ext_d <= '1';
		wait for 10 ns;
		ext_d <= '0';
	end process;
	
	reset_process: process
	begin
		wait for 30 ns;
		ext_reset <= '1';
		wait for 10 ns;
		ext_reset <= '0';
	end process;	
end architecture behavior;

