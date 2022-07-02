function [vertices, dz] = fixangle(z, tolerance)
% twist the point by tol if the inner angle is pi
%   Detailed explanation goes here
%% trim vortex
vertices = z;
if nargin < 2
    tolerance = 1E-4;
end
len = length(vertices);
twist = -tolerance * 1i;
flag = 0;
for ii=2:1:len-1
    angii = angle(vertices(ii+1)-vertices(ii));
    angiim = angle(vertices(ii)-vertices(ii-1));
    if abs(angii-angiim) < 1E-4
        vertices(ii) = vertices(ii) + twist*exp(1i*angii);
        flag = 1;
    end
end
angii = angle(vertices(1)-vertices(len));
angiim = angle(vertices(len)-vertices(len-1));
if abs(angii-angiim) < 1E-4
    vertices(len) = vertices(len) + twist*exp(1i*angii);
    flag = 1;
end
dz = vertices([2:len 1]) - vertices([1:len]);
if flag==1
    figure;
    plot(real(z), imag(z), '-k+');
    hold on;
    plot(real(vertices), imag(vertices), 'sr-');
    hold off;
    title('fixed geometry')
end
end

