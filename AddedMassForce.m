clc;
close all;
clear all;
setPlotParameters;
%% test cylinder
%% load points
% To do: load file data
t = (0:0.02:0.98)'*2*pi; % points no repeat
data = [cos(t) sin(t) t*0+1 t*0]; % x, y, ax, ay
curvetype = 0;%1 line segments, 0 closed curve
% calculate velocity potential
[force, mass] = calculateAddedMassForce(data, curvetype)
(mass(1,1) - pi )/pi % relative error

%% test ellipse
%% load points
% To do: load file data
t = (0:0.02:0.98)'*2*pi; % points no repeat
a = 1;
b = 0.1;
data = [a * cos(t) b * sin(t) t*0+1 t*0]; % x, y, ax, ay
curvetype = 0;%1 line segments, 0 closed curve
% calculate velocity potential
[force, mass] = calculateAddedMassForce(data, curvetype)
(mass(1,1) - pi*b*b )/(pi*b*b) % relative error


%% test plate
%% load points
% To do: load file data
t = (0:0.04:2)'; % points no repeat
data = [t 0*t t*0 t*0+1]; % x, y, ax, ay
curvetype = 1;%1 line segments, 0 closed curve
% calculate velocity potential
[force, mass] = calculateAddedMassForce(data, curvetype)
(mass(2,2) - pi )/pi % relative error