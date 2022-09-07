function [force, Mass] = calculateAddedMassForce(data, curvetype)
%getphi12 calculate velocity potential
%   Detailed explanation goes here
% mappings
% physics domain z; internel unit disk xi; externel unit disk zeta;
% z = f_extermap(xi), xi = -1/zeta
% =========on zeta plane======================
% potential flow of the externel unit disk: W(zeta) =  (U1' zeta + U1/zeta)
% =========on z plane=========================
% potential flow is w(z) = W(zeta), at infinity far
%     d w(z) / dz = d W/d zeta * d zeta/d xi / (dz / dxi),
% since dz / dxi = C/xi/xi at xi->0, (dz / dxi) / (d zeta / d xi) = C
% we have, U1 = U * conj(C)
% potential flow with moving body (negative direction): 
%     w_k(z) = W_k(z) - U' z, U_1=1, U_2=1i
% w_k = phi_k + i psi_k, phi_k is the potential function we need
%% create polygon
[vertices, dataindex] = linetopolygon(data, curvetype); % in counter clockwise
[vertices, dvert] = fixangle(vertices);
%% creat CS mapping
p = polygon(vertices);
f = extermap(p);
C = f.constant;
figure;
plot(f);
%% obtain z, xi, zeta, and phi1, phi2
xi = f.prevertex;
zeta = xi2zeta(xi);
z2 = f(xi); % points sorted by sc mapping
U1 = 1; U2 = 1i;
phi1 = real(complexpotential(zeta, z2, C, U1));
phi2 = real(complexpotential(zeta, z2, C, U2));
%% mapping phi1, phi2 to real physics points
z1 = vertices; % original z, contains acceleration infomation
[~, ind2] = matchindex(z1, z2); % z2(ind2) == z1
phi = [phi1(ind2) phi2(ind2)];
%% integral M_kl = Integral (phi_k n_l)
Mass = zeros(2, 2);
len = length(dvert);
dnorm = -dvert * 1i;
for kk=1:1:2
    mtmp = 0.5 * (phi(1, kk) + phi(len, kk)) * dnorm(len);
    for ii=1:1:len-1
        mtmp = mtmp + 0.5 * (phi(ii, kk) + phi(ii+1, kk)) * dnorm(ii);
    end
    Mass(1, kk) = real(mtmp);
    Mass(2, kk) = imag(mtmp);
end
%% integral force_k = Integral (phi_k a_l n_l)
force = zeros(2, 1);
len = length(dvert);
dnorm = -dvert * 1i;
for kk=1:1:2
    accphi = phi(:,kk) .* (data(dataindex, 3) - 1i*data(dataindex, 4));
    mtmp = 0.5 * (accphi(1) + accphi(len)) * dnorm(len);
    for ii=1:1:len-1
        mtmp = mtmp + 0.5 * (accphi(ii) + accphi(ii+1)) * dnorm(ii);
    end
    force(kk) = -real(mtmp);
end
end

