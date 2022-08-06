function kepler = loadkepler(filename)
%LOADKEPLER  	Load Kepler parameters for modeling GPS orbits
%
% 	kepler = LOADKEPLER(filename)
% 
%   INPUT
%   filename = name of the text file containing the six columns of
%   parameters
% 
%   OUTPUT
% 	kepler.svid = satellite identification numbers
%                 (this is column 1 of the input file)
% 	kepler.meananomaly = Mean anomalies(at reference time) in degrees
%                 (this is column 2 of the input file)
% 	kepler.omega = longitudes of the ascending nodes for the 
% 		           satellites (at weekly epoch) in degrees
%                 (this is column 3 of the input file)
% 	kepler.radius = orbit radii (semi-major axis) in meters
%                 (this is column 4 of the input file)
% 	kepler.inclination = inclination angles of orbital planes of
% 		                 the satellites(in degrees)
%                 (this is column 5 of the input file)
% 	kepler.reftime = reference times for the Kepler parameters for each
% 	                 satellite (in seconds relative to start of week)
%                 (this is column 6 of the input file)
% 
% 
    data = load(filename);    


    kepler = struct('svid', data(:,1), ...
                            'meananomaly', data(:,2), ...
                            'omega', data(:,3), ...
                            'radius', data(:,4), ...
                            'inclination', data(:,5),...
                            'reftime', data(:,6)...
                            );

    

end



    