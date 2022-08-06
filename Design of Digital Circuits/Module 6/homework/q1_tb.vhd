-- Like any other programming language, we should declare libraries

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

----------------------------------
-- Entity Declaration --
----------------------------------
-- Here we specify all input/output ports

entity integerToLED is
	port(
		clk_50MHz : in std_logic ;
		reset_btn : in std_logic;
		green_leds : out std_logic_vector (7 downto 0)
			);
end CountingLEDs;

----------------------------------
-- Architecture Declaration --
----------------------------------
-- here we put the description code of the design

architecture behave of integerToLED is
-- functional definitions

function i2std (myInteger, width : integer) return std_logic_vector is
	variable result: std_logic_vector(width-1 downto 0):= (others => '0');
	variable bits: integer:= width;
	begin
		for i in 0 to bits-1 loop
			if ((val/(2**i)) mod 2 = 1) then
				result(i) := '1';
			end if
		end loop
	return (result);
	end i2std;

--signal declaration
signal clk_1Hz : std_logic ;
signal scaler : integer range 0 to 25000000 ;
signal pre_count: std_logic_vector(7 downto 0);
signal count: std_logic_vector(7 downto 0);
signal integer_: integer;

begin
-- clk_1Hz_process process is used to generate a brief pulse once every second
	clk_1Hz_process : process( clk_50MHz , reset_btn )
	begin
		if (reset_btn = '0') then 
			clk_1Hz <= '0';
			scaler <= 0;
		
		elsif(rising_edge(clk_50MHz)) then 
		
			if (scaler < 25000000) then 
				scaler <= scaler + 1 ;
				clk_1Hz <= '0';
			else
			scaler <= 0;
			clk_1Hz <= '1';
			end if;
		end if;
	end process clk_1Hz_process;

	-- 8-bit counter process : counts from 0 to 255 and back
	counter_process : process (clk_1Hz, reset_btn)
	begin
		if reset_btn = '0' then
			pre_count <= "00000000";
		elsif (clk_1Hz='1' and clk_1Hz'event) then
			pre_count <= pre_count + "1";
		end if;
		count <= i2std(integer_, 8);
		count <= pre_count; 
	end process counter_process;
	-- final part of the program 
	green_leds <= count;
end behave;