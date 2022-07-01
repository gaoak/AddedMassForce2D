close all
clear
clc
% 单向无限域与圆内部转换
p  = polygon([Inf,-1+1i,-1-1i],[0,0.5,0.5]);
f = diskmap(p,18,9);
f = center(f,0.0+0i);
z = prevertex(f);
figure(1)
plot(f)
% figure(2)
% plot(p)
% hold on, axis equal
% [theata,rho,X,Y] = ellipse(200,10,0.3,0.3,1.0);
% plot(eval(f,X+1i*Y),'k')
% plot(eval(f,Y+1i*X),'k')
figure(3)
plot(exp(1i*linspace(0,2*pi)),'m','LineWidth',1);
hold on, axis equal
plot(z,'ro','LineWidth',1)
[X,Y] = meshgrid((-1.0:0.1:1.0),(-1.0:0.1:1.0));
plot(evalinv(f,X+1i*Y),'k')
plot(evalinv(f,Y+1i*X),'k')