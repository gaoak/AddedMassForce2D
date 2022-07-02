function [index1,index2] = matchindex(z1,z2, tol)
%UNTITLED5 Summary of this function goes here
%   z1(index1) == z2
%   z2(index2) == z1
if nargin < 3
    tol = 1E-4;
end
len = length(z1);
ind1 = findindex(z1(1), z2, tol);
ind2 = findindex(z1(2), z2, tol);
if ind2==ind1 + 1 || (ind2==1 && ind1==len)
    index2 = [ind1:1:len 1:1:(ind1-1)];
    index1 = [(len-ind1+2):1:len 1:1:(len-ind1+1)];
else
    index2 = [ind1:-1:1 len:-1:(ind1+1)];
    index1 = [ind1:-1:1 len:-1:(ind1+1)];
end
end

function ind = findindex(x, z, tol)
for ind=1:1:length(z)
    if abs(x-z(ind)) < tol
        return;
    end
end
end