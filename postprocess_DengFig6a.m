%%---------------------------------------
%% AM 732 group project
%%---------------------------------------
% This script can be used to recreate Figure 6a
% from Deng 2001.

clear all; close all;

dat = load('./simulation_results/07-Dec-2022_RMmodel_notes-forpoincare-beta2=0029.mat');
t = dat.t;
x = dat.x;
pars = dat.pars;

% fig specs
lw = 1.0; % linewidth

% start ID for after transient
start_time = 1000; %1500;
end_time   = 2400;

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
% f=0 
[X,Z] = meshgrid(0:0.01:1,0:0.01:0.3);
Y = (pars.beta1+X).*(1-X); 

% z-nullcline on f=0
xstar = (-pars.beta1*pars.delta2+pars.beta1+pars.delta2-...
    sqrt((pars.delta2-1)*((pars.beta1^2+2*pars.beta1+4*pars.beta2+1)*pars.delta2...
    -(pars.beta1+1)^2))-1)/(-2+2*pars.delta2); % constant value of x on z-nullcline
ystar = pars.delta2*pars.beta2/(1-pars.delta2); % constant value of y on z-nullcline
znull=linspace(0,0.3,100);
xnull=xstar*ones(100,1);
ynull=ystar*ones(100,1); 

% gamma nullcline on f=0
x0 = linspace(0, 1, 100);
y0 = (pars.beta1+x0).*(1-x0);
z0 = (pars.beta1*pars.delta1 + pars.delta1*x0 - x0).*(pars.beta1*x0 + x0.^2 - pars.beta1 - pars.beta2 - x0)./(pars.beta1 + x0); 

figure(2) % to recreate Fig. 6a from Hek
betterplots
plot3(x(startID:endID,3),x(startID:endID,1),x(startID:endID,2),'linewidth',lw) 
hold on
mesh(Z,X,Y, 'FaceAlpha', 0.8)
plot3(z0, x0, y0)
plot3(znull, xnull, ynull, 'Color', 'red')
xlabel('z')
ylabel('x')
zlabel('y')
xlim([0 0.25])
title(['\delta_2 = ' num2str(pars.delta2)])
hold off




