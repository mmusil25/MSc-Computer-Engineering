-- Homework 8 Question 4p1 
-- Design of Digital Circuits
-- Mark Musil

-- Translate the following code into an if-then-else statement: 

transmit <= signal_a when state = idle else
			signal_b when state = incoming else
			signal_c when state = outgoing else
			signal_d;
			
-- Answer
			
if state = idle then 
	transmit <= signal_a;

elsif state = incoming then
	transmit <= signal_b;
	
elsif state = outgoing then
	transmit <= signal_c;
	
else
	transmit <= signal_d;
	
end if;