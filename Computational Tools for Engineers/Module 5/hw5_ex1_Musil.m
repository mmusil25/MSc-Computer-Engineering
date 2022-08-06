A = [2 -1 1; 1 1 1; 3 -1 -1];
b = [4 3 1]';
x = A\b;
fprintf("The solution to the system is x = %4.2f, y = %4.2f, z = %4.2f \n",...
    x(1), x(2), x(3))

fprintf("The residual: \n")
r = A*x - b

fprintf("\nThe determinant of A is %4.2f \n", det(A))

fprintf("The condition estimator of A is %4.2f \n", rcond(A))