library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

----------------------------------
-- Entity Declaration --
----------------------------------
-- Here we specify all input/output ports

entity Blinker is 
port(
	clk_50MHz : in std_logic;
	tick_out : out std_logic
	);
end entity;

architecture RTL of Blinker is

begin
	clock_1hz_process : process(clk_50MHz) -- generates a 1 Hz clock
	variable scaler : natural;
	variable pulse : std_logic;
	begin
		if(rising_edge(clk_50MHz)) then 
			if (scaler < (25000000-1)) then 
				scaler := scaler + 1;
		else
			scaler := 0; -- reset scaler variable
			pulse := not(pulse); -- toggle the pulse variable
			end if;
		end if;

	tick_out <= pulse; -- assign the logic state of pulse to tick_out signal

	end process clock_1hz_process;
	
end RTL; 