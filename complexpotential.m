function W = complexpotential(zeta, z, C, U)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
W = C*(conj(U).*zeta + U./zeta) - conj(U).*z;
end

