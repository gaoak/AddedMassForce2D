close all
clear
clc

% file = fopen('Body0000.00000.plt','rb');
% % fseek(file, 2048, 'bof');
% data = fread(file,inf,'double');
% fclose(file);
% 
% contain = importdata('新建文本文档.txt');
% x = contain(:,1);
% y = contain(:,2);
% 
% z1 = x + 1i*y;
% for i=1:2:length(z1)
%    z1(i)=0; 
% end
% z1(z1==0)=[];
% z2 = zeros(length(z1)-2,1);
% for i=1:length(z1)-2
%    z2(i)=z1(end-i); 
% end
% z = [z1;z2];
% 
% p = polygon(z);
% f = extermap(p,18,9);
% z = prevertex(f);
% [theta,rho, X, Y]=circle(200,8,0.4,1);
% figure(1)
% plot(f)
% figure(2)
% plot(p)
% hold on, axis equal
% plot(eval(f,X+1i*Y),'k')
% plot(eval(f,Y+1i*X),'k')
% figure(3)
% plot(exp(1i*linspace(0,2*pi)),'m','LineWidth',1);
% hold on, axis equal
% plot(complex(z),'ro','LineWidth',1)
% [X,Y] = meshgrid((-0.8:0.03:0.8),(-0.8:0.03:0.8));
% plot(1./evalinv(f,X+1i*Y),'k')
% plot(1./evalinv(f,Y+1i*X),'k')

% p平面复速度势
syms z;
U = 1.0;
w_p = U * z;
dw_p = diff(w_p,z);

% sc变换
p = polygon([inf,1i,0],[-1,1.5,0.5]);
f = hplmap(p);
s = prevertex(f);
figure(1)
plot(f)

% 求在p平面内速度
[X,Y]=meshgrid((-4:0.4:4),(0.2:0.4:4));

dp=subs(dw_p,z,X+1i*Y);
up=real(double(dp));
vp=-imag(double(dp));

figure(2)
plot(polygon([-4,4]))
hold on
xlim([-4 4])
ylim([-1 5])
quiver(X,Y,up,vp)
% starty = (0:0.2:4);
% startx = -4*ones(size(starty));
% streamline(X,Y,up,vp,startx,starty)

% 求在z平面内速度
[X,Y]=meshgrid((-4:0.2:0),(1.2:0.2:4));
pp = evalinv(f,X+1i*Y);
dp=subs(dw_p,z,pp);
dz=double(dp./evaldiff(f,pp));
uz=real(dz);
vz=-imag(dz);

figure(3)
plot(polygon([-4+1i,1i,0,4,0,1i]))
hold on
xlim([-4 4])
ylim([-1 5])
quiver(X,Y,uz,vz)

[X,Y]=meshgrid((0.2:0.2:4),(0.2:0.2:4));
pp = evalinv(f,X+1i*Y);
dp=subs(dw_p,z,pp);
dz=double(dp./evaldiff(f,pp));
uz=real(dz);
vz=-imag(dz);
quiver(X,Y,uz,vz)
% starty = (0:0.2:1.2);
% startx = 0.1*ones(size(starty));
% streamline(X,Y,uz,vz,startx,starty)
