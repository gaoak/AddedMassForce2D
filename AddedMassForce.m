clc;
close all;
clear all;
setPlotParameters;

%% load points
% To do: load file data
t = (0:0.01:0.99)'*2*pi;
data = [cos(t) sin(t) t*0 t*0+1]; % x, y, ax, ay

curvetype = 0;%1 line segments, 0 closed curve
%% calculate velocity potential
Mass = calculateAddedMass(data, curvetype)
