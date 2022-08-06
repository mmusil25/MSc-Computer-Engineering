


library ieee;
use ieee.std_logic_1164.all;

entity TB_for_my_entity is
end entity;

architecture TB_setup of TB_for_my_entity is

signal TB_clock: std_logic := '0';
signal TB_a, TB_b, TB_c: std_logic := '0';
signal TB_q: std_logic;

component my_entity port
	(
		a: in std_logic;
		b: in std_logic;
		c: in std_logic;
		clk: in std_logic;
		q: out std_logic
		); end component;

begin


	DUT: my_entity
		port map(
			clk => TB_clock,
			a => TB_a,
			b => TB_b, 
			c => TB_c, 
			q => TB_q
			); 
			
	clock_process: process
	begin
		TB_clock <= '1';
		wait for 5 ns;
		TB_clock <= '0';
		wait for 5 ns;
	end process;
	
	test_stimuli: process
	
	begin
		TB_a <= '0';
		TB_b <= '0';
		TB_c <= '1';
		wait for 20 ns;
		
		TB_a <= '0';
		TB_b <= '1';
		TB_c <= '0';
		wait for 20 ns;
		
		
		TB_a <= '0';
		TB_b <= '1';
		TB_c <= '1';
		wait for 20 ns;
		
		
		TB_a <= '1';
		TB_b <= '0';
		TB_c <= '0';
		wait for 20 ns;
		
		
		TB_a <= '1';
		TB_b <= '0';
		TB_c <= '1';
		wait for 20 ns;
		
		
		TB_a <= '1';
		TB_b <= '1';
		TB_c <= '0';
		wait for 20 ns;
		
		
		TB_a <= '1';
		TB_b <= '1';
		TB_c <= '1';
		wait for 20 ns;
		
		
		TB_a <= '0';
		TB_b <= '0';
		TB_c <= '0';
		wait for 20 ns;
		
	end process;
	
end TB_setup;