-- Mark Musil
-- Homework 8 question 4

-- Translate the following code to two with-select-when statements


case state is
	when idle => a <= "11"; b <= "00";
	when terminate | increase => a <= "01"; b <= "--";
	when maintain | decrease => a <= "10"; b <= "11";
	when others => a <= "11"; b <= "01";
end case;


-- Answer 


with state select
	a <= "11" when idle,
		 "01" when terminate | increase, 
		 "10" when maintain | decrease,
		 "11" when others;
end case;

with state select 
	b <= "00" when idle,
		 "--" when terminate | increase,
		 "11" when maintain | decrease,
		 "01" when others;
end case;
	