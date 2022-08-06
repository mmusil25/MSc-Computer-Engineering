% C:\Curtis\EE5003\EE5003ModsSummer2015\CoordinateFrames\VolumeOfSphericalShell.m
% Copyright (c) 2015 by OU AEC and Curtis Cohenour (cohenour@ohio.edu). All Rights Reserved.
% 20150406 Jcc (Curtis Cohenour) original from C:\Curtis\EE5003\EE5003ModsSummer2015\CoordinateFrames\SphericalCoordinates.m
clc, clear, close all, %close all hidden
d2r=pi/180;
%% find the volume of a sphere with inner radius of 8m and outer radius of 10m analytically
V10=4/3*pi*10^3;
V08=4/3*pi* 8^3;
Vtru=V10-V08
%% compute the volume
dr=0.01;
dTht=3;
dPhi=3;
V=0;
for r=8:dr:(10-dr)
    for Tht=0:dTht:(180-dTht)
        for Phi=0:dPhi:(360-dPhi);
            dv=r^2*sin(Tht*d2r)*dr*dTht*dPhi*d2r^2;
            V=V+dv;
        end
    end
end
V
        