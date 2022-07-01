close all
clear
clc
% 椭圆与圆外域相互变换

[~,~,z] = ellipse0(3,2,50);
p  = polygon(z);
f = extermap(p,18,9);
s = prevertex(f);
figure(1)
plot(f)
figure(2)
plot(p)
hold on, axis equal
[theata,rho,X1,Y1] = ellipse(200,6,1.2,1.2,4.2);
plot(eval(f,1./(X1+1i*Y1)),'k')
plot(eval(f,1./(Y1+1i*X1)),'k')
figure(3)
% [theata2,rho2,X2,Y2] = ellipse(200,10,3,2,8);
[X2,Y2] = meshgrid((-4:0.1:4),(-4:0.1:4));
plot(1./evalinv(f,X2+1i*Y2),'k')
hold on, axis equal
plot(1./evalinv(f,Y2+1i*X2),'k')
[x,y,~] = ellipse0(1,1,50);
fill(x,y,'w')
plot(exp(1i*linspace(0,2*pi)),'m','LineWidth',1);
plot(s,'ro','LineWidth',1)

function [x,y,z]= ellipse0(a,b,n)
x=zeros(n+1,1);
y=zeros(n+1,1);
for i=1:n+1
    dtheata = 2*pi/n;
    x(i) = a*cos(i*dtheata);
    y(i) = b*sin(i*dtheata);
end
z = x + 1i*y;
end