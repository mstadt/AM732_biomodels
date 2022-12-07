# Rosenzweig-MacArthur food chain model
These code files are used to explore the Rosenzweig-MacArthur food chain model as presented in [Hek, 2010](https://link.springer.com/article/10.1007/s00285-009-0266-7) for the AM 732 Fall 2022 group project by Amelia, Zara, and Melissa.

This is based on the model given in [Deng, 2001](https://aip.scitation.org/doi/abs/10.1063/1.1396340).

## modelcode.m
This script can be used to simulate the model equations. The "user input" section can be used to change parameter values to explore the impact on changes in the system. 
User input option given to save simulation results to use for postprocessing.
The script **postprocess_general.m** can then be used to generate plots of the saved simulation results.

## postprocess_general.m
This script can be used to make plots for a given simulation created by **modelcode.m**. User input consists of a file where simulation results are stored.

## postprocess_DengFig6a
This script can be used to regenerate Figure 6a from Deng 2001.

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
These are figures our group created based on the model code with various simulations. Figure explanations are given in the folder README.
