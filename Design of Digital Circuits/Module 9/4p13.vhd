architecture has_errors of design

begin

p1: process

	begin
		if clk'event and clk='1' then
			q <= a or b and c;
		end if;
	end;
	
end;