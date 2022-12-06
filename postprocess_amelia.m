clear all; close all;

dat = load('06-Dec-2022_RMmodel_notes-delta2=0647401.mat');
t = dat.t;
x = dat.x;
pars = dat.pars;

% fig specs
lw = 1.0; % linewidth

% start ID for after transient
start_time = 1500;
end_time   = 2000;

startID = find(t>start_time,1,'first');
endID = find(t>end_time,1,'first');
% make the figures
figure(1) %to recreate the "period-doubling cascade" plots in Fig. 6
betterplots
plot3(x(startID:endID,3),x(startID:endID,1),x(startID:endID,2),'linewidth',lw) 
xlabel('z')
ylabel('x')
zlabel('y')
title(['\delta_2 = ' num2str(pars.delta2)])
hold off

% for figure 2
[X,Z] = meshgrid(0:0.01:1,0:0.01:0.3);
Y = (pars.beta1+X).*(1-X); %f=0 
%y=pars.delta2*pars.beta2/(1-pars.delta2); %z-nullcline of f=0?

%gamma nullcline on f=0
x0 = linspace(0, 1, 100);
y0 = (pars.beta1+x0).*(1-x0);
z0 = (pars.beta1*pars.delta1 + pars.delta1*x0 - x0).*(pars.beta1*x0 + x0.^2 - pars.beta1 - pars.beta2 - x0)./(pars.beta1 + x0); 

figure(2) % to recreat Fig. 6a from Hek
betterplots
plot3(x(startID:endID,3),x(startID:endID,1),x(startID:endID,2),'linewidth',lw) 
hold on
mesh(Z,X,Y)
plot3(z0, x0, y0)
xlabel('z')
ylabel('x')
zlabel('y')
xlim([0 0.25])
title(['\delta_2 = ' num2str(pars.delta2)])
hold off
