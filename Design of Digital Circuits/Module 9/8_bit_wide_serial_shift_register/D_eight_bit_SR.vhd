

library ieee;
use ieee.std_logic_1164.all;

entity D_eight_bit_SR is port(
	clock: in std_logic;
	serial_in: in std_logic;
	serial_out: out std_logic
	);
	end D_eight_bit_SR;
	
architecture behavioral of D_eight_bit_SR is 

signal internal_bus : std_logic_vector(6 downto 0);

component D_FLIP_FLOP port(
						clk: in std_logic;
						d: in std_logic;
						q: out std_logic
						); end component;

begin
	
	D_FLIP_FLOP1: D_FLIP_FLOP
		port map(
				clk => clock, 
				d => serial_in,
				q => internal_bus(0)
				);
		
	D_FLIP_FLOP2: D_FLIP_FLOP
		port map(
				clk => clock,
				d => internal_bus(0),
				q => internal_bus(1)
				);
	
	D_FLIP_FLOP3: D_FLIP_FLOP
		port map (
				clk => clock,
				d => internal_bus(1),
				q => internal_bus(2)
				);
				
	
	D_FLIP_FLOP4: D_FLIP_FLOP
		port map(
				clk => clock,
				d => internal_bus(2),
				q => internal_bus(3)
				);
		
	D_FLIP_FLOP5: D_FLIP_FLOP
		port map(
				clk => clock,
				d => internal_bus(3),
				q => internal_bus(4)
				);
	
	D_FLIP_FLOP6: D_FLIP_FLOP
		port map (
				clk => clock,
				d => internal_bus(4),
				q => internal_bus(5)
				);
	D_FLIP_FLOP7: D_FLIP_FLOP
		port map (
				clk => clock,
				d => internal_bus(5),
				q => internal_bus(6)
				);
				
	D_FLIP_FLOP8: D_FLIP_FLOP
		port map (
				clk => clock,
				d => internal_bus(6),
				q => serial_out
				);

end behavioral;

