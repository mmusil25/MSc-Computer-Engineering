library ieee;
use ieee.numeric_bit.all;

entity test_bench_for_decrementer is
end test_bench_for_decrementer;

architecture behavioral of test_bench_for_decrementer is

	signal test_vector: bit_vector(7 downto 0) := X"06";
	signal overflow: bit:= '0';
	 
	
	procedure decrement_a_bit_vector (
		signal bit_vector_in : in bit_vector(7 downto 0);
		signal bit_vector_out: out bit_vector(7 downto 0);
		signal underflow: out bit := '0'
		) is
	
	begin 
		
		if bit_vector_in = X"00" then
			underflow <= '1';			
		else
			bit_vector_out <= bit_vector(unsigned(bit_vector_in) - 1);
		end if;
		wait for 1 ns;
	end decrement_a_bit_vector;
	
begin

	process is
	begin 
		wait for 10 ns;
		decrement_a_bit_vector(test_vector, test_vector, overflow);
		wait for 10 ns;
		decrement_a_bit_vector(test_vector, test_vector, overflow);
		wait for 10 ns;
		decrement_a_bit_vector(test_vector, test_vector, overflow);
		wait for 10 ns;
		decrement_a_bit_vector(test_vector, test_vector, overflow);
		wait for 10 ns;
		decrement_a_bit_vector(test_vector, test_vector, overflow);
		wait for 10 ns;
		decrement_a_bit_vector(test_vector, test_vector, overflow);
		wait for 10 ns;
		decrement_a_bit_vector(test_vector, test_vector, overflow);
		wait for 10 ns;
		decrement_a_bit_vector(test_vector, test_vector, overflow);
		wait;
	end process;

end behavioral;



