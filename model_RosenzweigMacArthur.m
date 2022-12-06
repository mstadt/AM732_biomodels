%% AM 732 Group Project Model Code
% This code can be used to solve the Rosenzweig-MacArthur
% model as presented in the paper Deng, Chaos, 2001.

clear all; close all;

%%------------------------
%% User Input
%%------------------------
% Set parameter values for the model equations
pars.xi       = 0.1;  % default: 0.1
pars.ep       = 0.4;  % default: 0.4
pars.beta1    = 0.3;  % default: 0.3
pars.beta2    = 0.03; % default: 0.03
