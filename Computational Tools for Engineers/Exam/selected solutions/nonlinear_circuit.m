function f = nonlinear_circuit(t,v)
%  nonlinear_circuit.m
%
%  EE 5003
%  M. Braasch
%

source_freq = 10e6;   % 10 MHz
R = 2000;             % 2 kilo-Ohm resistors
C = 1e-12;            % 2 pico-Farad capacitors
Is = 0.5e-16;         % saturation current
VT = 0.025;           % thermal voltage

E = 2*sin(2*pi*source_freq*t);
f = zeros(2,1);
f(1) = (-1/(R*C))*(v(1)-E) + (-1/(R*C))*(v(1)-v(2));
f(2) = (-1/(R*C))*(v(2)-v(1)) - (Is/C)*(exp(v(2)/VT)-1);
