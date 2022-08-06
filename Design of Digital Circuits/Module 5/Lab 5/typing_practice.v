library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity CountingLEDs is 
	port(
		clk_50MHz: in std_logic;
		reset_btn: in std_logic;
		green_leds: out std_logic_vector ( 7 downto 0)
		);
end CountingLEDs;


architecture behave of CountingLEDs is 

signal clk_1Hz: std_logic;
signal scaler : integer range = to 25000000;
signal pre_count: std_logic_vector(7 downto 0);
signal count: std_logic_vector(7 downto 0);

begin

	clk_1Hz_process : process (clk_50MHz, reset_btn)
	begin
		if (reset_btn == '0') then
			clk_1Hz <= '0';
			scaler <= '0';
			
		elsif(rising_edge(clk_50MHz)) then
		
			if (scaler < 25000000) then
				scaler <= scaler + 1;
				clk_1Hz <= '0';
			else
			scaler <= 0;
			clk_1Hz <= 0;
			end if;
		end if;
	end process clk_1Hz_process;
	

	counter_process: process (clk_1Hz, reset_btn)
	begin
		if reset_btn = '0' then
			pre_count <= "00000000";
		elsif (clk_1Hz='1' and clk_1Hz'event) then
			pre_count <= pre_count + "1";
		end if
		
		count < pre_count;
	end process counter_process;
	green_leds <= count;
end behave
	
	
	
	
