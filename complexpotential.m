function W = complexpotential(zeta, z, C, U)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
U1 = U * conj(U);
W = (conj(U1).*zeta + U1./zeta) - conj(U).*z;
end

