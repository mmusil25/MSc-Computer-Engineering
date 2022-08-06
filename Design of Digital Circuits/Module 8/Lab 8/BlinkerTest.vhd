-- Library declaration

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity declaration

entity BlinkerTest is
	port(
			clk_10MHz: in std_logic;
			switch_1: in boolean;
			clk_out: out std_logic
			);
end entity;

architecture behave of BlinkerTest is

-- Signal declaration

signal clk_1Hz: std_logic := '0';
signal clk_2Hz: std_logic := '0';
signal scaler: integer range 0 to 5000000;
signal second_scaler: integer range 0 to 2500000;

begin

-- Process used to scale down the 10 MHz frequency from the PLL to a 1Hz rate. 

	clk_process: process(clk_10MHz, switch_1) is
	begin
		if(rising_edge(clk_10MHz)) then
			
			if (NOT(switch_1) AND (scaler  < 5000000)) then
				scaler <= scaler + 1;
			elsif switch_1 AND (second_scaler < 2500000) then
				second_scaler <= second_scaler + 1;
			
		else 
			if NOT(switch_1) then
				scaler <= 0;
				clk_1Hz <= NOT(clk_1Hz);	
				clk_out <= clk_1Hz;				
			else if switch_1 then 
				second_scaler <= 0;
				clk_2Hz <= NOT(clk_2Hz);
				clk_out <= clk_2Hz;
			end if;	
		end if;
	end if;
	end if;
	end process clk_process;
	


end behave;