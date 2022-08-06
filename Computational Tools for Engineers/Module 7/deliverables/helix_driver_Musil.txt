
time = -8*pi:0.001:8*pi;

x_of_t = exp(time./10).*sin(time);

y_of_t = exp(time./10).*cos(time);

z_of_t = time;

% MATLAB® default 3D view
figure
plot3(x_of_t, y_of_t, z_of_t)
title("MATLAB Default 3D View")
xlabel("x(t)")
ylabel("y(t)")
zlabel("z(t)")

% MATLAB® default 2D view  <-- What does this mean? 

figure
plot(x_of_t, y_of_t)
title("MATLAB Default 2D View")
xlabel("x(t)")
ylabel("y(t)")
zlabel("z(t)")


% the X-Z plane

figure
plot(x_of_t, z_of_t)
title("The X-Z plane")
xlabel("x(t)")
ylabel("y(t)")
zlabel("z(t)")


% the Y-Z plane

figure
plot(y_of_t, z_of_t)
title("The Y-Z plane")
xlabel("x(t)")
ylabel("y(t)")
zlabel("z(t)")

% a customized view of your choice that you have decided 
% provides the most accurate 3D view of the function
figure
funx =@(t) exp(t/10)*sin(t);
funy =@(t) exp(t/10)*cos(t);
funz =@(t) t;
fplot3(funx, funy, funz, '--or')
title("Custom 3D plot using the fplot3 function")
xlabel("x(t)")
ylabel("y(t)")
zlabel("z(t)")
