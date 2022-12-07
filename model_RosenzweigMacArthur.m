%% AM 732 Group Project Model Code
% This code can be used to solve the Rosenzweig-MacArthur
% model as presented in the paper Deng, Chaos, 2001.

% Simulation results can be saved and then figures made using the
% postprocessing script.

clear all; close all;

%%------------------------
%% User Input
%%------------------------
% Set parameter values for the model equations
pars.zeta     = 0.1;    % default: 0.1
pars.ep       = 0.2; %0.4;    % default: 0.4
pars.beta1    = 0.3;    % default: 0.3
pars.beta2    = 0.0290; %0.03;   % default: 0.03
pars.delta1   = 0.1;    % default: 0.1
pars.delta2   = 0.8200; %0.6975; % default: 0.6975

% set inital conditions for model simulation
x0 = 0.5*ones(3,1);

% time to simulate
tend  = 2500; % end time
tspan = [0,tend];

%%-----------------------------
%% End of User Input
%%-----------------------------

%%------------------------------------
%% Numerically simulate ODE system
%%------------------------------------
% NOTE: this model is stiff thus we used the 
%   MATLAB implementation ode23s with the following options
%   These options may be adjusted when adjusting parameter values
%   if users run into numerical issues.
options = odeset('RelTol', 1.0e-6, 'AbsTol', 1.0e-9);
fprintf('** solving ODE system ** \n')
[t,x] = ode23s(@(t,x) RMfoodchainDeng(t,x,pars),tspan, x0, options);
fprintf('** ODE system complete ** \n')

%%------------------------------------
%% Save Model Simulation Results
%%------------------------------------
savefile = input('Do you want to save the simulation results? (0 - no, 1 - yes)   ');
if savefile
   % user input a string for simulation results file name
   notes = input('simulation notes: ');
   save_fname = strcat(date, '_RMmodel_notes-', notes, '.mat');
   % check to make sure the save file does not exist
   if isfile(save_fname)
       notes = input('WARNING! filename exists! change notes: ');
       save_fname = strcat(date, '_RMmodel_notes-', notes,'.mat');
   end
   % save simulation results and simulation specifications
   save(save_fname, 't', 'x', 'pars', 'x0', 'options', 'tspan');
   fprintf('simulation results saved to: %s \n', save_fname)
end

%%------------------------------------
%% Function used for model equations
%%------------------------------------
function dxdt = RMfoodchainDeng(t,x,pars)
% NOTE: let x = x1, y = x2, z = x3 from equations written in Deng 2001
    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    dxdt = zeros(3,1);
    dxdt(1) = (1/pars.zeta)*x1*(1-x1-(x2/(pars.beta1 + x1)));
    dxdt(2) = x2*(x1/(pars.beta1 + x1) - pars.delta1 - x3/(pars.beta2 + x2));
    dxdt(3) = (pars.ep)*x3*(x2/(pars.beta2 + x2) - pars.delta2);
end
