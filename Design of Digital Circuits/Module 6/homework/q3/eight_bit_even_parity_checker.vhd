-- Description: Cascaded XOR operations implement an 8 parity check

-- Imports
library ieee;
use ieee.std_logic_1164.all;


entity test_bench_for_parity_checker is
end test_bench_for_parity_checker;

architecture behavioral of test_bench_for_parity_checker is 
-- Signal Declarations

	-- External signals
	signal even_vector: std_logic_vector(7 downto 0) := b"01010101";
	signal odd_vector: std_logic_vector(7 downto 0) := b"01010111";
	signal parity_result: std_logic; -- Indicates even parity



	
-- Perform parity check	

procedure eight_bit_parity_checker (
	signal vector_under_test : in std_logic_vector(7 downto 0);
	signal result: out std_logic := '0'
	) is
	
	-- Internal signals
	variable a1, a2, a3, b1, b2, b3, f1: std_logic := '0';
	
	begin
	
	a1 := vector_under_test(0) xor vector_under_test(1);
	a2 := vector_under_test(2) xor vector_under_test(3);
	a3 := a2 xor a1;
	
	b1 := vector_under_test(4) xor vector_under_test(5);
	b2 := vector_under_test(6) xor vector_under_test(7);
	b3 := b2 xor b1;
	
	f1 := not(b3 xor a3);
	
	result <= f1;
	
	
	
	end eight_bit_parity_checker;

-- Test bench  
begin

	process is
	begin
		wait for 10 ns;
		eight_bit_parity_checker(even_vector, parity_result);
		wait for 10 ns;
		eight_bit_parity_checker(odd_vector, parity_result);
		
	end process;
	
end behavioral;