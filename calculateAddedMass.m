function [Mass] = calculateAddedMass(data, curvetype)
%getphi12 calculate velocity potential
%   Detailed explanation goes here
% mappings
% physics domain z; internel unit disk xi; externel unit disk zeta;
% z = f_extermap(xi), xi = -1/zeta
% potential flow with static body: W(zeta) =  (U' zeta + U/zeta)
% potential flow with moving body (negative direction): W_k(zeta) = U_k/zeta, U_1=1, U_2=1i
% W_k = phi_k + i psi_k, phi_k is the potential function we need
%% create polygon
vertices = linetopolygon(data, curvetype); % in counter clockwise
[vertices, dvert] = fixangle(vertices);
%% creat CS mapping
p = polygon(vertices);
f = extermap(p);
figure;
plot(f);
%% obtain z, xi, zeta, and phi1, phi2
xi = f.prevertex;
zeta = xi2zeta(xi);
U1 = 1; U2 = 1i;
phi1 = real(U1./zeta);
phi2 = real(U2./zeta);
%% mapping phi1, phi2 to real physics points
z1 = vertices; % original z, contains acceleration infomation
z2 = f(xi); % points sorted by sc mapping
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
    Mass(1, kk) = -real(mtmp);
    Mass(2, kk) = -imag(mtmp);
end
end

