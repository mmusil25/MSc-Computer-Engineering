% C:\Curtis\EE5003\EE5003ModsSummer2015\CoordinateFrames\SphericalCoordinates.m
% Copyright (c) 2015 by OU AEC and Curtis Cohenour (cohenour@ohio.edu). All Rights Reserved.
% 20150406 Jcc (Curtis Cohenour) original
clc, clear, close all, %close all hidden
d2r=pi/180;
%% Plot a sphere in rectangual coordinates
R=10;                        % radius
i=0;                         % index for 
Xyz=NaN(100e3,3);
for Tht=20:60 %0:3:180
    for Phi=-20:3:40 % 0:3:360
        x=R*sin(Tht*d2r)*cos(Phi*d2r);
        y=R*sin(Tht*d2r)*sin(Phi*d2r);
        z=R*cos(Tht*d2r);
        kXyz=[x y z];
        i=i+1;
        Xyz(i,:)=kXyz;
    end
end
Xyz=Xyz(1:i,:);
figure(100)
plot3(Xyz(:,1),Xyz(:,2),Xyz(:,3),'.');
grid on
rotate3d on
axis equal
xlabel('x')
ylabel('y')
zlabel('z')


        