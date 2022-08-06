library ieee;
use ieee.std_logic_1164.all;
use iee.numeric_std.all;

entity DoubleDabble is
	port (
		binIN: in std_logic_vector(5 downto 0);
		ones: out std_logic_vector(3 downto 0);
		tens: out std_logic_vector(3 downto 0)
		);
end entity DoubleDabble;

architecture RTL of DoubleDabble is
	type t_BCD_State is (s_IDLE, s_SHIFT, s_CHECK_SHIFT_INDEX, s_ADD, 
						 s_CHECK_DIGIT_INDEX, s_BCD_DONE);
	signal r_SM_Main: t_BCD_State := s_IDLE;
	
	-- The vector containing the output ones BCD
	signal r_ones: std_logic_vector(3 downto 0) := (others => '0');
	signal r_tens: std_logic_vector(3 downto 0) := (others => '0');
	
	-- The vector that contains the input binary value being shifted
	signal r_binIN: std_logic_vector(5 downto 0) := (others => '0');
	
	-- Keeps track of which decimal digit we are indexing
	signal r_Digit_Index: natural range 0 to 1 := 0;
	
begin

	DoubleDabble: process (binIN)
		variable v_Upper : natural;
		variable v_Lower : natural;
		variable v_BCD_Digit : unsigned(3 downto 0);
	begin
		if rising_edge(i_Clock) then
		
	