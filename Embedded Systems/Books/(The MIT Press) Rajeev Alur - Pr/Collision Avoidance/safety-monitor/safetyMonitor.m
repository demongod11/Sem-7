function [ flag ] = safetyMonitor( in1, in2 )
% in1, in2: Data Structure that stores information about the aircraft
%       (x, y): Current Location of the aircraft
%       (xd, yd): Destination of aircraft
%       theta: Current direction of motion
%       m: Message from neighbouring aircraft 
%           - empty if aircraft not in neighbourhood
%           - (x, y, xd, yd, theta) of other aircraft if non-empty
%
% flag: true if the safety is voilated and false otherwise.
   
[px1, py1] = prevpos(in1.x, in1.y, in1.theta);
[px2, py2] = prevpos(in2.x, in2.y, in2.theta);

% check collision
if ((abs(in1.x - in2.x) < 1) && (abs(in1.y - in2.y) < 1))
    flag = true;
    return;
    
% check if a swap happened
elseif (px1 == in2.x && py1 == in2.y && px2 == in1.x && py2 == in1.y)
    flag = true;
    return;    
else
    flag = false;
end

return

