close all
clear
clc
% 矩形与圆外域相互变换
p  = polygon([1+1i,-1+1i,-1-1i,1-1i]);
f = extermap(p,18,9);
z = prevertex(f);
figure(1)
plot(f)
figure(2)
plot(p)
hold on, axis equal
[theata,rho,X,Y] = ellipse(200,6,1.2,1.2,4.2);
% [X,Y] = meshgrid((-1.5:0.1:1.5),(-1.5:0.1:1.5));
plot(eval(f,1./(X+1i*Y)),'k')
plot(eval(f,1./(Y+1i*X)),'k')
figure(3)
plot(exp(1i*linspace(0,2*pi)),'m','LineWidth',1);
hold on, axis equal
plot(z,'ro','LineWidth',1)
[X1,Y1] = meshgrid((1:0.1:2),(-1:0.1:2));
plot((1+1i)/sqrt(2)./evalinv(f,X1+1i*Y1),'k')
plot((1+1i)/sqrt(2)./evalinv(f,Y1+1i*X1),'k')
[X2,Y2] = meshgrid((-1:0.1:2),(-2:0.1:-1));
plot((1+1i)/sqrt(2)./evalinv(f,X2+1i*Y2),'k')
plot((1+1i)/sqrt(2)./evalinv(f,Y2+1i*X2),'k')
[X3,Y3] = meshgrid((-2:0.1:-1),(-2:0.1:1));
plot((1+1i)/sqrt(2)./evalinv(f,X3+1i*Y3),'k')
plot((1+1i)/sqrt(2)./evalinv(f,Y3+1i*X3),'k')
[X4,Y4] = meshgrid((-2:0.1:1),(1:0.1:2));
plot((1+1i)/sqrt(2)./evalinv(f,X4+1i*Y4),'k')
plot((1+1i)/sqrt(2)./evalinv(f,Y4+1i*X4),'k')