% C:\Curtis\EE5003\EE5003ModsSummer2015\Vectors\CurlEx1m.m
% Copyright (c) 2015 by OU AEC and Curtis Cohenour (cohenour@ohio.edu). All Rights Reserved.
% 20150330 Jcc (Curtis Cohenour) original
clc, clear, close all, %close all hidden
%% set up mesh
Xvc=(-5:2:5)';
Yvc=(-5:2:5)';
Zvc=(-5:2:5)';
[X,Y,Z]=meshgrid(Xvc, Yvc, Zvc);
%% plot V
Vx=X.^2;                 % Ex 1 Vx from curl video
Vy=3*X.*Z.^2;            % Ex 1 Vy from curl video
Vz=-2*X.*Z;              % Ex 1 Vz from curl video
figure(110)
quiver3(X, Y, Z, Vx, Vy, Vz);
grid on
%% compute curl
Crlx=-6.*X.*Z;
Crly=2*Z;
Crlz=3*Z.^2;
figure(120)
quiver3(X, Y, Z, Crlx, Crly, Crlz);
grid on
tmp=0;

