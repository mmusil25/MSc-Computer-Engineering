library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity DisplayDriver is
	port (
		scan_clk: in std_logic;
		minute_ones: in std_logic_vector(3 downto 0);
		minute_tens: in std_logic_vector(3 downto 0);
		hour_ones: in std_logic_vector(3 downto 0);
		hour_tens: in std_logic_vector(3 downto 0);
		display_out: out std_logic_vector(6 downto 0);
		digit_vector: out std_logic_vector(3 downto 0)
		);
end entity DisplayDriver;

architecture RTL of DisplayDriver is
	
	signal seven_segment_variable: std_logic_vector(6 downto 0);
	signal digit_to_map: std_logic_vector(3 downto 0);
	signal scan_counter: std_logic_vector(1 downto 0) := (others => '0');
	signal internal_digit_vector: std_logic_vector(3 downto 0) := "0001";
	
	begin
		process(scan_clk)
			begin
			
			if (scan_clk'event and scan_clk = '1') then
			
				scan_counter <= std_logic_vector(unsigned(scan_counter(1 downto 0)) + 1);
	
				case scan_counter is
				when "00" =>
					digit_to_map(3 downto 0) <= minute_ones(3 downto 0);
					internal_digit_vector(3 downto 0) <= "0001";
				when "01" =>
					digit_to_map(3 downto 0) <= minute_tens(3 downto 0);
					internal_digit_vector(3 downto 0) <= "0010";
				when "10" =>
					digit_to_map(3 downto 0) <= hour_ones(3 downto 0);
					internal_digit_vector(3 downto 0) <= "0100";
				when "11" =>
					digit_to_map(3 downto 0) <= hour_tens(3 downto 0);
					internal_digit_vector(3 downto 0) <= "1000";
				when others =>
					digit_to_map(3 downto 0) <= minute_ones(3 downto 0);
					internal_digit_vector(3 downto 0) <= "0001";
					
				end case;
				
			end if;
			
			digit_vector(3 downto 0) <= internal_digit_vector(3 downto 0);
			
			end process;
		
		process(digit_to_map) 
			begin
			
			case digit_to_map is
				when "0000" =>
					seven_segment_variable <= "1111110"; -- 0
				when "0001" =>
					seven_segment_variable <= "0110000"; -- 1
				when "0010" =>
					seven_segment_variable <= "1101101"; -- 2
				when "0011" =>
					seven_segment_variable <= "1111001"; -- 3
				when "0100" =>
					seven_segment_variable <= "0110011"; -- 4
				when "0101" =>
					seven_segment_variable <= "1011011"; -- 5
				when "0110" =>
					seven_segment_variable <= "1011111"; -- 6
				when "0111" => 
					seven_segment_variable <= "1110000"; -- 7
				when "1000" =>
					seven_segment_variable <= "1111111"; -- 8
				when "1001" =>
					seven_segment_variable <= "1110011"; -- 9
				when others => 
					seven_segment_variable <= "1111110"; -- 0
			end case;
		end process;
			
		process(seven_segment_variable)
			begin
			display_out(6 downto 0) <= seven_segment_variable(6 downto 0);
		end process;		

end RTL;
	
		
	
		