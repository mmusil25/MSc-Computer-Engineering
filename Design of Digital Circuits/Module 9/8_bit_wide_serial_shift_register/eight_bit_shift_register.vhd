
library ieee;
use ieee.std_logic_1164.all;

entity eight_bit_shift_register is port(
		clock: in std_logic;
		serial_in: in std_logic;
		serial_out: out std_logic
		); 		
	end eight_bit_shift_register;
	
architecture behavioral of eight_bit_shift_register is

signal internal: std_logic_vector(7 downto 0);

begin

	clock_process: process(clock)
	
	begin
		
		if (clock'event and clock = '1') then
		
			for i in 0 to 6 loop
				internal(i+1) <= internal(i);
			end loop;
		internal(0) <= serial_in;
		end if;
		
	end process;
	
	serial_out <= internal(7);
	
end behavioral;