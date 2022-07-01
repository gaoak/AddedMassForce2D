function [theta,rho,X,Y] = ellipse(M,N,a0,b0,a1)
% 生成圆或椭圆外部网格
theta = zeros(M + 1, N + 1); 
rho = zeros(M + 1, N + 1);
dtheta = 2 * pi / M;
drho = (a1 - a0)/N;
c0 = sqrt(a0^2-b0^2);
e0 = c0/a0;
if a0==b0
   % 圆
   for i=1:M + 1
       for j=1:N + 1
           theta(i,j)=(i-1)*dtheta;
           rho(i,j)=(j-1)*drho + a0;
       end
   end
else
    % 椭圆
    for i=1:M + 1
       for j=1:N + 1
           theta(i,j)=(i-1)*dtheta;
           aa = ((j-1)*drho + a0);
           bb = aa * sqrt(1-e0^2);
           rho(i,j)=sqrt(1/((cos(theta(i,j))/aa)^2+(sin(theta(i,j))/bb)^2));
       end
    end
end
% polarplot(theta,rho)
[X,Y]=pol2cart(theta,rho);
end

