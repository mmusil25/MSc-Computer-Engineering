
library ieee;
use ieee.std_logic_1164.all;

entity t_flip_flop is port (
		clk, t, synch_reset : in std_logic;
		q : out std_logic

		); end component;
	end t_flip_flop;
	
architecture letsBehave of t_flip_flop is

begin 

	t_flip_flop_process: process(clk, synch_reset) begin
		if(synch_reset) then 
			q <= '0';
		elsif rising_edge(clk) then 
			if(t) then
				q <= not q;
			end if;
		end if;
	end process;
end letsBehave;