function temperature_equilibrium()
% script m-file: temperature_equilibrium.m
%
% A demonstration of how the mass of water changes the resulting
% temperature equlibrium when the liquid is put in a steel container

clc; clear; close all;

% constants and parameters
ms = 1.89;                          % mass of the steel container [kg]
cw = 4184; cs = 466;                % specific hear capacities [J/kg*°C]]
Tw = 30 + (rand() - 0.5) * 0.01;    % initial temperature of water
Ts = 21 + (rand() - 0.5) * 0.01;    % initial temperature of the steel conatainer

% mw (kg), Teq_exp (°C)
data = [
    5, 29.62; 5, 29.67; 5, 29.63;
    6, 29.69; 6, 29.69; 6, 29.73;
    7, 29.75; 7, 29.71; 7, 29.74;
    8, 29.74; 8, 29.75; 8, 29.78;
];

mw = data(:, 1); Teq_exp = data(:, 2);

% theoretical equilibrium temperatures
Teq_theo = (mw .* cw .* Tw + ms .* cs .* Ts) ./ (mw .* cw + ms .* cs);

% nonlinear fit
g_mw = 1 ./ (mw .* cw + ms .* cs);
X = [ones(length(mw), 1), g_mw];
y = Teq_exp;
a = (X' * X) \ (X' * y);

Teq_fit = a(1) + a(2) ./ (mw .* cw + ms .* cs);

residuals = Teq_exp - Teq_fit;
RSS = sum(residuals.^2),

tolerance = 0.05;  % acceptable deviation threshold [°C]
large_diff_idx = find(abs(Teq_exp - Teq_theo) > tolerance)',

% theoretical model extension
mw_theo = 4:0.01:9;
Teq_theo_ext = (mw_theo .* cw .* Tw + ms .* cs .* Ts) ./ (mw_theo .* cw + ms .* cs);
Teq_fit_ext = a(1) + a(2) ./ (mw_theo .* cw + ms .* cs);

% Plot results
    figure; hold on; grid on;
        plot(mw_theo, Teq_theo_ext, 'b-', 'LineWidth', 2, 'DisplayName', 'Theoretical Teq');
        plot(mw, Teq_exp, 'mx', 'MarkerSize', 6, 'DisplayName', 'Experimental Data');
        plot(mw_theo, Teq_fit_ext, 'r--', 'LineWidth', 2, 'DisplayName', 'Nonlinear Fit');
            xlabel('Mass of Water (kg)');
            ylabel('Equilibrium Temperature (°C)');
            title('Water Mass vs. Equilibrium Temperature');
            legend('Location', 'best');

% EOF