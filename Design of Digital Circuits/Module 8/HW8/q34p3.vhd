-- Mark Musil
-- Homework 8 problem 3


-- Translate the following code to a case-when statement

with state select
	data <= "0000" when idle | terminate, 
			"1111" when increase,
			"1010" when maintain, 
			"0101" when decrease,
			"----" when others;
			
			
-- Answer

case state is 
	when idle | terminate => data <= "0000";
	when increase => data <= "1111";
	when decrease => data <= "1010";
	when others => data <= "----";
end case;