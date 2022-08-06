x = 0:pi/20:4*pi;
plot(x, sin(x));
hold on;
plot(x , exp(-0.1*x).*sin(x), 's')
hold off

hkids = get(gca, 'child');

set( hkids(1), 'marker', 's');
set( hkids(2), 'linew', 2);

hdecay = findobj('marker', 's');