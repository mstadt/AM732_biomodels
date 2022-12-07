%% AM 732 Group Project Postprocessing
% This code can be used to make general figures for the
% Rosenzweig-MacArthur model as presented in the paper Deng, Chaos, 2001.

% To create figures of a single model simulation, import the model
% simulation .mat file here.

clear all; close all; % clear workspace
%%--------------------------------------
%% Begin User Input
%%--------------------------------------
% write a string of the filename where simulation results are stored
% EX:'./simulation_results/06-Dec-2022_RMmodel_notes-original
% params.mat'
sim_file = './simulation_results/06-Dec-2022_RMmodel_notes-original params.mat'; 

% pick start and end time for simulation plots
% NOTE: ensure that end_time < tend from the simulations
start_time = 1000; % time to start simulation plots (skip transient)
end_time   = 2000; % end time for simulation plots

% choose figure specifications
lw  = 1.0; % linewidth
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


%% Make the figures

%% Time seris plot
figure(1)
clf;
startID  = find(t>start_time,1,'first');
endID    = find(t>end_time,1,'first');
plot(t(startID:endID),x(startID:endID), 'linewidth', lw)
hold on
plot(t(startID:endID),y(startID:endID), 'linewidth', lw)
plot(t(startID:endID),z(startID:endID), 'linewidth', lw)
xlabel('t')
ylabel('x,y,z')
legend('x', 'y', 'z')
xlim([start_time, end_time])