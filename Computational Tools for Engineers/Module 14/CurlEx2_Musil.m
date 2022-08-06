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
Vx=-Y;                 % Ex 1 Vx from curl video
Vy=X;            % Ex 1 Vy from curl video
Vz=zeros(6,6,6);              % Ex 1 Vz from curl video
figure(110)
quiver3(X, Y, Z, Vx, Vy, Vz);
title('Quiver of V');
grid on
%% compute curl
Crlx=zeros(6,6,6);
Crly=zeros(6,6,6);
Crlz=2*Z;
figure(120)
quiver3(X, Y, Z, Crlx, Crly, Crlz);
title('Curl of V');
grid on
tmp=0;
