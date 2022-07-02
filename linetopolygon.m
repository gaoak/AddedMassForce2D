function [vertices] = linetopolygon(data, curvetype)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
verts = data(:,1) + 1i*data(:,2);
if curvetype==1
    len = length(verts);
    vertices = [verts.', verts(len-1:-1:2).'];
else
    vertices = verts.';
end
end

