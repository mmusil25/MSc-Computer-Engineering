library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DoubleDabble is 
	port (
		binIN: in std_logic_vector(5 downto 0);
		ones: out std_logic_vector(3 downto 0);
		tens: out std_logic_vector(3 downto 0)
	--	scratch_space_TP: out std_logic_vector(13 downto 0);
	--	k_tp_out: out std_logic_vector(2 downto 0)
		);
end entity DoubleDabble;

architecture RTL of DoubleDabble is

	signal scratch_space: std_logic_vector(13 downto 0) := (others => '0');

	signal change_detector: std_logic := '0';
	signal new_vec: std_logic_vector(5 downto 0):= (others => '0');
	signal old_vec: std_logic_vector(5 downto 0):= (others => '1');
--	signal k_tp: std_logic_vector(2 downto 0):= (others => '0');
	
begin
	
	
	DoubleDabble_Process: process(binIN)
	begin
	new_vec(5 downto 0) <= binIN(5 downto 0);
	
	
	if (new_vec /= old_vec) then
		change_detector <= '1';
	else
		change_detector <= '0';
	end if;
	
	if (change_detector = '1') then
	
		scratch_space(5 downto 0) <= binIN(5 downto 0);
		--scratch_space_TP(13 downto 0) <= scratch_space(13 downto 0);
		
		shift_loop: for k in 0 to 5 loop -- Loop and shift and increment
			--k_tp <= std_logic_vector(to_unsigned(k, 3));
			--k_tp_out(2 downto 0) <= k_tp(2 downto 0);
			-- Shift left one bit
			
			scratch_space(13 downto 0) <= scratch_space(12 downto 0) & '0';
			
			-- Examine the contents of the BCD digits and increment them
			
			if scratch_space(13 downto 10) > "0101" then 
				scratch_space(13 downto 10) <= std_logic_vector(unsigned(scratch_space(13 downto 10)) + 3);
			end if;
			if scratch_space(9 downto 6) > "0101" then
				scratch_space(9 downto 6) <= std_logic_vector(unsigned(scratch_space(9 downto 6)) + 3);
			end if;
			
			--scratch_space_TP(13 downto 0) <= scratch_space(13 downto 0);
			
		end loop shift_loop;
		
		tens(3 downto 0) <= scratch_space(13 downto 10);
		ones(3 downto 0) <= scratch_space(9 downto 6);
	
	end if;	
	old_vec(5 downto 0) <= binIN(5 downto 0);
	
	end process DoubleDabble_Process;
end RTL;

