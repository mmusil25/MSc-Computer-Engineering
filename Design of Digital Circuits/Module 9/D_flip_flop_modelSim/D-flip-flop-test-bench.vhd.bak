-- Mark Musil
-- This file describes a D flip flop and runs a few tests on it. 

library ieee;
use ieee.std_logic_1164.all;

entity D-flip-flop-test-bench is
end entity;

architecture behavior of D-flip-flop-test-bench is

signal ext_d : std_logic;
signal ext_q : std_logic := "1";
signal ext_reset, ext_clk: std_logic := "0"; 

component D_FLIP_FLOP port(
							clk, d, synchronous_reset : in std_logic;
							q : out std_logic;
							); end component;
	
begin 

	ext_clk <= NOT(ext_clk) after 5 ns;
	ext_d <= NOT(ext_d) after 30 ns;
	ext_reset <= NOT(ext_reset) after 50 ns;

	DUT: D_FLIP_FLOP port map(
						clk => ext_clk, 
						d => ext_d, 
						synchronous_reset => ext_reset, 
						q => ext_q);

end architecture behavior;

