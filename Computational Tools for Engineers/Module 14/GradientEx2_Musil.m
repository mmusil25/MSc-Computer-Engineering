% C:\Curtis\EE5003\EE5003ModsSummer2015\Vectors\GradientEx1.m
% Copyright (c) 2015 by OU AEC and Curtis Cohenour (cohenour@ohio.edu). All Rights Reserved.
% 20150330 Jcc (Curtis Cohenour) original
clc, clear, close all, %close all hidden
%% plot T vs X Y with Z=0;
Xvc=(-10:10)';
Yvc=(-10:10)';
Zvc=1; % (-10:10)';
[X,Y,Z]=meshgrid(Xvc, Yvc, Zvc);
T=(X.^2).*(Y.^3).*(Z.^4);                      % this is ex 1 from video
figure(100)
surf(X,Y,T);
title('Surface of T(x,y,z)');
%% plot Gradient;
Xvc=(-10:2:10)';
Yvc=(-10:2:10)';
Zvc=(-2:1:2)';
[X,Y,Z]=meshgrid(Xvc, Yvc, Zvc);
T=(X.^2).*(Y.^3).*(Z.^4);
%Delt=[2*x+3*Y^2+4*z^3]';
DelX=2*X;
DelY=3*Y.^2;
DelZ=4*Z.^3;
figure(200)
quiver3(X,Y,Z,DelX,DelY,DelZ)
title('Quiver of T(x,y,z)');
grid on

