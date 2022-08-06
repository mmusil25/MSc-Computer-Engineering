library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_SecondGenerator is
end entity;

architecture behavioral of TB_SecondGenerator is

signal TB_tick_in: std_logic := '0';
signal TB_minute_out: std_logic;
signal TB_second: std_logic_vector(5 downto 0);

component SecondGenerator port (
	tick_in: in std_logic;
	minute_out: out std_logic;
	second: out std_logic_vector(5 downto 0)
	);
end component;

begin
                                                                                             
	DUT: SecondGenerator port map(
		tick_in => TB_tick_in,
		minute_out => TB_minute_out,
		second => TB_Second
		);
	
	tick_process: process
	
	begin 	
		TB_tick_in <= '0';
		wait for 5000 ms;
		TB_tick_in <= '1';
		wait for 5000 ms;
	end process;

end behavioral;
