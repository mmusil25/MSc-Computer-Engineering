-- Question 4p2
-- Mark Musil

-- Translate the following code to a when-else statement

process (a, b, j, k)
	begin
		if a = "1" and b = "0" then
			step <= "0100";
		elsif a = "1" then 
			step <= j;
		elsif b = "1" then
			step <= k;
		else
			step <= "----";
		end if;
	end process; 

-- To a when-else statement


process (a, b, j, k)
begin
step <= "0100" when (a = "1" and b = "0") else
		j 	   when a = "1" else
		k      when b = "1" else
		"----" when others;
end process;