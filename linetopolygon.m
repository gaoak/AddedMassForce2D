function [vertices, index] = linetopolygon(data, curvetype)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
verts = data(:,1) + 1i*data(:,2);
len = length(verts);
if curvetype==1
    index = [1:1:len len-1:-1:2]';
else
    index = [1:1:len]';
end
vertices = verts(index);
end

