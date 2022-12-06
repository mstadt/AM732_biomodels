# AM732_biomodels
These code files are used to explore the Rosenzweig-MacArthur food chain model as presented in Hek, JMB, 2010 for the AM 732 Fall 2022 group project for Amelia, Zara, and Melissa.

This is based on the model given in [Deng, 2001](https://aip.scitation.org/doi/abs/10.1063/1.1396340).

## modelcode.m
This script can be used to simulate the model equations. The "user input" section can be used to change parameter values to explore the impact on changes in the system. User input option given to save simulation results to use for postprocessing.

### simulation_results/
This directory contains .mat files of simulation results used from modelcode.m with varied parameter values.

Instructions: To use in MATLAB type
```
load(FILENAME)
```
to get a struct with fields:
- **options** options used for ode23 solver
- **pars** parameter values use for simulation
- **t** time points
- **x** variable values, NOTE: x(:,1) = x, x(:,2) = y, x(:,3) = z in Deng model equations
- **x0** initial conditions

### figures/
