% Copyright (c) 2015 by OU AEC and Curtis Cohenour (cohenour@ohio.edu). All Rights Reserved.
% 20150225 Jcc (Curtis Cohenour) original
close all, clear, clc
d2r=pi/180;
%% plot a cylinder along the z axis of radius 2, with the ends at z= -1 and 4
% start with the walls
Res=.1; % linear resoltuion
Rsa=5;  % angular resolution
R=2;    % radius of cylinder        % R is constant
Z=(-1:Res:4)';                      % z values
Phi=(0:Rsa:359)';                   % phi values
% do it the hard way
figure(100)               % open a figure
plot3(NaN,NaN,NaN,'.');   % estblish the axis 
hold on
for i=1:length(Z)         % for each z value
    z=Z(i);           
    for j=1:length(Phi)        % for each phi value
        phi=Phi(j);
        x=R*cos(phi*d2r);           % compute x
        y=R*sin(phi*d2r);           % compute y
        plot3(x,y,z,'.');           % plot note z value does not change
    end
end
hold off
grid on
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
rotate3d on           % turn on rotation
% do the end caps
z=Z(1);               % bottom first
hold on
for r=0:Res:R         % for the caps z is fixed and the value of r and phi change        
   for j=1:length(Phi)
        phi=Phi(j);
        x=r*cos(phi*d2r);       % x
        y=r*sin(phi*d2r);       % y
        plot3(x,y,z,'g.');      % make the bottom green
   end
end    
z=Z(end); % do the top   same as above with a different z value
for r=0:Res:R
   for j=1:length(Phi)
        phi=Phi(j);
        x=r*cos(phi*d2r);
        y=r*sin(phi*d2r);
        plot3(x,y,z,'c.'); % make the top cyan
   end
end    
hold off
%% Now using mesh grid
% make a mesh grid for the sides
[Zmsh PhiMsh]=meshgrid(Z,Phi);
% Zmsh contains columns of z values
% PhiMsh contains rows of angles
% now compute Xmsh and Ymsh
Xmsh=R*cos(PhiMsh*d2r);          % compute all of the x value at once
Ymsh=R*sin(PhiMsh*d2r);          % compute all of the z value at once
figure(200)
plot3(Xmsh, Ymsh, Zmsh, 'b.');   % use plot 3 to plot
grid on
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
rotate3d on       
% now comput the top and bottom
Rvec=(0:Res:R)';
[Rmsh1 PhiMsh1]=meshgrid(Rvec,Phi);
% Rmsh1 contains columns of radius
% PhiMsh1 contains rows of angles
Xmsh1=Rmsh1.*cos(PhiMsh1*d2r);
Ymsh1=Rmsh1.*sin(PhiMsh1*d2r);
Zmsh1=0*Xmsh1+Z(1);
hold on
plot3(Xmsh1, Ymsh1, Zmsh1, 'g.');
% now the top
Zmsh2=0*Xmsh1+Z(end);
plot3(Xmsh1, Ymsh1, Zmsh2, 'c.');
hold off
%% compute the area copy from the first plot
% dA=dz*(R*dPhi)
Acy=0;          % init area of cylinder should be h*pi*R
dZ=Res;         % dZ is the linear resolution
dPhi=Rsa*d2r;   % dPhi is the angular resulution converted to radians
% integrate the side area
for i=1:length(Z)-1  % for area don't integrate the last one.
    z=Z(i);
    for j=1:length(Phi)
        dA=dZ*R*dPhi;
        Acy=Acy+dA;
    end
end
h=Z(end)-Z(1);
AcyTru=2*pi*R*h;
PrcErrCyl=(Acy-AcyTru)/AcyTru*100;
%% integrate top and bottom
% da=(r*dPhi)*dR % Radial length is dR, angular length is r*dPhi
Atop=0;
for r=0:Res:(R-Res) %  
   for j=1:length(Phi)
       r1=r+Res/2;          % use the mean value of the radius
       dA=(r1*dPhi)*Res;
       Atop=Atop+dA;
   end
end    
AtopTru=pi*R^2;
PrcErrTop=(Atop-AtopTru)/AtopTru*100
%% top and bottom are the same size
Abot=Atop;
AbotTru=AtopTru;
%% compute total area
Area=Acy+Atop+Abot;
AreaTru=AcyTru+AtopTru+ AbotTru;
PrcErr=(Area-AreaTru)/AreaTru*100
