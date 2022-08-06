library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_DisplayDriver is
end entity;

architecture behavorial of TB_DisplayDriver is

signal TB_scan_clk: std_logic := '0';
signal TB_minute_ones: std_logic_vector(3 downto 0) := (others => '0');
signal TB_minute_tens: std_logic_vector(3 downto 0) := (others => '0');
signal TB_hour_ones: std_logic_vector(3 downto 0) := (others => '0');
signal TB_hour_tens: std_logic_vector(3 downto 0) := (others => '0');
signal TB_display_out: std_logic_vector(6 downto 0);
signal TB_digit_vector: std_logic_vector(3 downto 0);

component DisplayDriver port(
		scan_clk: in std_logic:= '0';
		minute_ones: in std_logic_vector(3 downto 0);
		minute_tens: in std_logic_vector(3 downto 0);
		hour_ones: in std_logic_vector(3 downto 0);
		hour_tens: in std_logic_vector(3 downto 0);
		display_out: out std_logic_vector(6 downto 0);
		digit_vector: out std_logic_vector(3 downto 0)
		);
	end component;

begin

DUT: DisplayDriver port map(
	scan_clk => TB_scan_clk,
	minute_ones => TB_minute_ones,
	minute_tens => TB_minute_tens,
	hour_ones => TB_hour_ones,
	hour_tens => TB_hour_tens,
	display_out => TB_display_out,
	digit_vector => TB_digit_vector
	);
	
	scan_clk_process: process
	begin
	
		TB_scan_clk <= '0';
		wait for 2 ms;
		TB_scan_clk <= '1';
		wait for 2 ms;
	end process;
	
	test_process: process
	
	begin
		-- Cycle through each output and make sure new numbers will 
		-- be reached after scan_clk repeats its period		
		
		TB_minute_ones <= "0001";
		wait for 10 ms;
		TB_minute_ones <= "0010";
		wait for 10 ms;
		TB_minute_ones <= "0011";
		wait for 10 ms;
		TB_minute_ones <= "0100";
		wait for 10 ms;
		TB_minute_ones <= "0000";
		wait for 20 ms;
		
		TB_minute_tens <= "0001";
		wait for 10 ms;
		TB_minute_tens <= "0010";
		wait for 10 ms;
		TB_minute_tens <= "0011";
		wait for 10 ms;
		TB_minute_tens <= "0100";
		wait for 10 ms;
		TB_minute_tens <= "0000";
		wait for 20 ms;
		
		TB_hour_ones <= "0001";
		wait for 10 ms;
		TB_hour_ones <= "0010";
		wait for 10 ms;
		TB_hour_ones <= "0011";
		wait for 10 ms;
		TB_hour_ones <= "0100";
		wait for 10 ms;
		TB_hour_ones <= "0000";
		wait for 20 ms;
		
		TB_hour_tens <= "0001";
		wait for 10 ms;
		TB_hour_tens <= "0010";
		wait for 10 ms;
		TB_hour_tens <= "0011";
		wait for 10 ms;
		TB_hour_tens <= "0100";
		wait for 10 ms;
		TB_hour_tens <= "0000";
		wait for 20 ms;
	end process;
end behavorial;

		
		