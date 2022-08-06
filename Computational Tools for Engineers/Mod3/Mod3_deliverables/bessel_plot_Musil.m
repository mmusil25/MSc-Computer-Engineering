%  EE 5003
%  Mark Musil
%  January 29
%
%  Solve for real roots of monomials

z = -20:0.1:20;


% Calculate the Bessel function of the first kind for three orders

J = zeros(3, length(z));

for i = 1:3
    J(i,:) = besselj(i, z);
  
end
figure
plot(z, J(1,:))
grid on
legend("J_1","Location", "Best")
title("Bessel Functions of the first kind for $\nu = 1$", "interpreter", "latex")
xlabel('z', 'interpreter', 'latex')
ylabel('$J_1(z)$', 'interpreter', 'latex')

figure
plot(z, J(2,:))
grid on
legend("J_2","Location", "Best")
title("Bessel Functions of the first kind for $\nu = 2$", "interpreter", "latex")
xlabel('z', 'interpreter', 'latex')
ylabel('$J_2(z)$', 'interpreter', 'latex')

figure
plot(z, J(3,:))
grid on
legend("J_3","Location", "Best")
title("Bessel Functions of the first kind for $\nu = 3$", "interpreter", "latex")
xlabel('z', 'interpreter', 'latex')
ylabel('$J_3(z)$', 'interpreter', 'latex')



