%
%  nonlinear_solver.m
%
%  EE 5003
%
clear all
close all

% Call the ODE stiff solver for tstart=0, tstop=300ns, I.C.s all zero
[t, v] = ode15s(@nonlinear_circuit,[0 300e-9],[0;0],[]);

% Since the source voltage is defined within nonlinear_circuit.m, we need
% to recreate it here so that we can plot it out.
time = linspace(0,300e-9,300);
source_freq = 10e6;   % 10 MHz
E = 2*sin(2*pi*source_freq*time);

subplot(311)
plot(time*1e9,E)
title('Nonlinear Circuit Simulation')
ylabel('source voltage')
subplot(312)
plot(t*1e9,v(:,1))
ylabel('v(1)')
subplot(313)
plot(t*1e9,v(:,2))
ylabel('v(2)')
xlabel('time [nanoseconds]')


