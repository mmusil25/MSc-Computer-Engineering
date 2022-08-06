
library ieee;
use ieee.std_logic_1164.all;

entity D_FLIP_FLOP is
	port(
		q: out std_logic;
		clk: in std_logic;
		synchronous_reset: in std_logic;
		d: in std_logic
		);
		
end D_FLIP_FLOP;

architecture behavioral of D_FLIP_FLOP is

begin 
	
	clocked_process: process(clk)
	begin
		if (rising_edge(clk)) then
			if (synchronous_reset = '1') then
				q <= '0';
			else
				q <= d;
			end if;
		end if;
	end process clocked_process;
end behavioral;
		