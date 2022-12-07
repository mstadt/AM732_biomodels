%% AM 732 Group Project Postprocessing
% This code can be used to make general figures for the
% Rosenzweig-MacArthur model as presented in the paper Deng, Chaos, 2001.

% To create figures of a single model simulation, import the model
% simulation .mat file here.

clear all; close all; % clear workspace
%%--------------------------------------
%% Begin User Input
%%--------------------------------------
% sim_file is the filename where simulation results are stored
% EX:'./simulation_results/06-Dec-2022_RMmodel_notes-originalparams.mat'
% change for desired simulation
sim_file = './simulation_results/06-Dec-2022_RMmodel_notes-original params.mat'; 

% pick start and end time for simulation plots
% NOTE: ensure that end_time < tend from the simulations
start_time = 1000; % time to start simulation plots (skip transient)
end_time   = 2000; % end time for simulation plots

% choose figure specifications
lw  = 1.0; % linewidth
xlab_font = 16; % x-axis label fontsize
ylab_font = 16; % y-axis label fontsize
zlab_font = 16; % z-axis label fontsize
leg_font  = 18; % legend font size
%%---------------------------------------
%% End User Input
%%---------------------------------------

%% Load the data
dat   = load(sim_file);
t     = dat.t;      % time values
temp  = dat.x;      % model results
x     = temp(:,1);  % x values
y     = temp(:,2);  % y values
z     = temp(:,3);  % z values
pars  = dat.pars;   % parameters

% find index of first and last time point
startID  = find(t>start_time,1,'first');
endID    = find(t>end_time,1,'first');

% print parameter values to command window for simulation
fprintf('parameter values: \n')
disp(pars)

%%-----------------------------------------
%% Make the figures
%%-----------------------------------------
%% Time series plot
figure(1)
clf;
plot(t(startID:endID),x(startID:endID), 'linewidth', lw)
hold on
plot(t(startID:endID),y(startID:endID), 'linewidth', lw)
plot(t(startID:endID),z(startID:endID), 'linewidth', lw)
xlabel('t', 'fontsize', xlab_font)
ylabel('x,y,z', 'fontsize', ylab_font)
legend('x', 'y', 'z', 'fontsize', leg_font)
xlim([start_time, end_time])

%% Phase space in x and z
figure(2)
clf;
plot(x(startID:endID),z(startID:endID),'linewidth',lw)
xlabel('x', 'fontsize', xlab_font)
ylabel('z', 'fontsize', ylab_font)

%% Phase space in y and z
figure(3)
clf;
plot(y(startID:endID),z(startID:endID),'linewidth',lw)
xlabel('y', 'fontsize', xlab_font)
ylabel('z', 'fontsize', ylab_font)

%% Phase space in x and y
figure(4)
clf;
plot(x(startID:endID),y(startID:endID),'linewidth', lw)
xlabel('x', 'fontsize', xlab_font)
ylabel('y', 'fontsize', ylab_font)

%% Plot 3D figure
figure(5)
clf;
plot3(x(startID:endID), y(startID:endID), z(startID:endID), 'linewidth', lw)
xlabel('x', 'fontsize', xlab_font)
ylabel('y', 'fontsize', ylab_font)
zlabel('z', 'fontsize', zlab_font)

