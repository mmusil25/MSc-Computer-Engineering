library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_DoubleDabble is
end entity;

architecture behavioral of TB_DoubleDabble is

signal TB_binIN: std_logic_vector(5 downto 0);
signal TB_ones: std_logic_vector(3 downto 0);
signal TB_tens: std_logic_vector(3 downto 0);
--signal TB_Test_Point_Scratch_Space: std_logic_vector(13 downto 0);
--signal TB_k_tp: std_logic_vector(2 downto 0);

component DoubleDabble port(
	binIN: in std_logic_vector(5 downto 0);
	ones: out std_logic_vector(3 downto 0);
	tens: out std_logic_vector(3 downto 0)
	--scratch_space_TP: out std_logic_vector(13 downto 0);
--	k_tp_out: out std_logic_vector(2 downto 0)
	);
end component;

begin 

DUT: DoubleDabble port map(
	binIN => TB_binIN,
	ones => TB_ones,
	tens => TB_tens
--	scratch_space_TP => TB_Test_Point_Scratch_Space,
--	k_tp_out => TB_k_tp
	);
	
	test_process: process 
	
	begin
		TB_binIN <= "001111"; -- 15 Base 10
		wait for 20 ms;
		TB_binIN <= "010010"; -- 18 Base 10;
		wait for 20 ms;
		TB_binIN <= "010101"; -- 21 Base 10
		wait for 20 ms;
		TB_binIN <= "010111"; -- 23 Base 10;
		wait for 20 ms;
		
	end process test_process;
end behavioral;
