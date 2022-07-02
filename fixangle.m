function [vertices, dz] = fixangle(z, tolerance)
% twist the point by tol if the inner angle is pi
%   Detailed explanation goes here
%% trim vortex
vertices = z;
if nargin < 2
    tolerance = 1E-4;
end
len = length(vertices);
dz = vertices([2:len 1]) - vertices([1:len]);
ang = angle(dz);
twist = -tolerance * 1i;
flag = 0;
for ii=2:1:len
    iim = ii-1;
    if abs(ang(ii)-ang(iim)) < 1E-4
        vertices(ii) = vertices(ii) + twist*exp(1i*ang(ii));
        flag = 1;
    end
end

if flag==1
    figure;
    plot(real(z), imag(z), '-k+');
    hold on;
    plot(real(vertices), imag(vertices), 'sr-');
    hold off;
    title('fixed geometry')
end
end

