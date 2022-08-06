%
%  langtonsant.m
%
%  This animated version implements the basic Langton Ant with an all white
%  grid.  The ant starts off facing east (right).  The grid is 100 x 100.
%
%  M. Braasch
%  EE 5003
%  June 2013
%
%  antdirection:  0 = east
%                90 = north
%               180 = west
%               270 = south
%
%  gridcolor:  0 = white
%              1 = black

% start
clear all
close all

% initialize grid to all zeros (i.e., white)
gridcolor = zeros(100,100);

% specify the bounds of the grid
x_min = 1;  x_max = 100;
y_min = 1;  y_max = 100;

% initialize ant position to the middle of the grid
ant_x = 50;
ant_y = 50;

% initialize the ant direction to east
antdirection = 0;

% create initial plot with handle 'p', specifying the x and y values as
% ant_x and ant_y, set the marker type as a square and set erasemode to
% none so that all points are shown
p = ????????????;

% Set plot axis to span the grid
axis([0 100 0 100])

% specify the loop variable to indicate if the ant is still inside the grid
inside = 1;

% count the number of steps needed to reach the edge of the grid
total_steps = 0;

while inside == 1,
    total_steps = total_steps + 1;
    
    if gridcolor(ant_x,ant_y) == 0,  % if the square is white, then
        antdirection = antdirection + 90;  % turn 90 deg to the right
    else   % otherwise the square is black, so
        antdirection = antdirection - 90;  % turn 90 deg to the left
    end
    
    % check antdirection and modify if necessary to keep it in the range of
    % 0 to 360 degrees
    if antdirection >= 360,
        antdirection = antdirection - 360;
    elseif antdirection < 0,
        antdirection = antdirection + 360;
    end
    
    % the ant always flips the color of the square that it is on
    gridcolor(ant_x,ant_y) = ~gridcolor(ant_x,ant_y);
    
    if gridcolor(ant_x,ant_y) == 0,   % if the grid square is white, then
        % set the Marker edge and face color to white for the x,y point 
        set(p,??????????
    else  % the grid square is black, so
        % set the Marker edge and face color to black for the x,y point 
        set(p,??????????
    end        
    ???????     % execute the graphics set immediately above

    % determine the x and y direction of the ant motion (i.e., the position
    % change for each coordinate)
    ant_motion_x = cosd(antdirection);
    ant_motion_y = sind(antdirection);
    
    % move the ant to the next square
    ant_x = ant_x + ant_motion_x;
    ant_y = ant_y + ant_motion_y;

    % determine if the ant has move outside the grid; if so, set inside to
    % 0 so that the loop terminates
    if (ant_x<x_min) || (ant_x>x_max),
        inside = 0;
    elseif (ant_y<y_min) || (ant_y>y_max),
        inside = 0;
    end
    
end

