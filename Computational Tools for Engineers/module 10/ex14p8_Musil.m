% Define the function to be integrated

fun = @(x, T) (x.^(-5)).*((exp(1.432./(T.*x))-1).^(-1));

T = 3500;

% Evaluate the integral
factor = 64.77/(T^4);
my_evaluated_integral = factor*integral(@(x)  fun(x,3500), 4e-5, 7e-5);

% Compare the results
textbook_result = 14.512667;
fprintf('\n Textbook Result %f %% \n' , textbook_result);
fprintf('\n Result %8.7f %% \n', my_evaluated_integral);

the_difference = abs(my_evaluated_integral - textbook_result);

fprintf('\n The difference %10.8f %% \n', the_difference);