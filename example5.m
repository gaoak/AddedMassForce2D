close all
clear
clc
p = polygon([-0.5,0.5,-0.5]);
f = extermap(p,18,9);
z = prevertex(f);
figure(1)
plot(f)
figure(2)
plot(p)
hold on, axis equal
[theata,rho,X,Y] = ellipse(200,6,1.2,1.2,3.2);
plot(eval(f,1./(X+1i*Y)),'k')
plot(eval(f,1./(Y+1i*X)),'k')
figure(3)
[X,Y] = meshgrid((-0.8:0.03:0.8),(-0.8:0.03:0.8));
plot(1./evalinv(f,X+1i*Y),'k')
hold on, axis equal
plot(1./evalinv(f,Y+1i*X),'k')
[x,y,~] = ellipse0(1,1,100);
fill(x,y,'w')
plot(exp(1i*linspace(0,2*pi)),'m','LineWidth',1);
plot(complex(z),'ro','LineWidth',1)

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
