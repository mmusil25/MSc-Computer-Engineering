
my_sin_function_handle = @sin;
my_sin_derivative_handle = @cos;
my_initial_guess = pi/4;

% Run the test

my_result = newtfun_Musil(my_sin_function_handle, my_sin_derivative_handle, my_initial_guess);


