% script m-file: water_properties.m
%
% Main file to allow user to select which function to run
% for visualizing water properties.

% Simulation Options:
% 1. Sand Particle Density Simulation,
% 2. Water Temperature Equilibrium Analysis.

% Current choice:
choice = 1;

if (choice == 1),
    density_simulation();
elseif (choice == 2),
    temperature_equilibrium();
end

% EOF