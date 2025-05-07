function density_simulation()
% script m-file: density_simulation.m
%
% Simplified coarse sand particle simulation in different water densities
% using Stokes' Law and assuming no interactions.

clc; clear; close all;

num = 1000;
cWidth = 10;
cHeight = 10;
timeStep = 0.03;
numSteps = 400;
min_w_d = 800;
max_w_d = 1200;
grain_d = 2600;
gravity = [0, -9.8];
drag_coef = 0.1;

positions = [rand(num, 1) * cWidth, ...
             (cHeight - 1) * ones(num, 1)];
vels = zeros(num, 2);
water_d = rand(num, 1) * (max_w_d - min_w_d) + min_w_d;

% Stokes' Law approximation
settling_vels = (2/9) * gravity(2) * (grain_d - water_d) .* 0.001^2 / (1e-3);

low_d_color = [0, 0, 1];    % Blue for low densities
mid_d_color = [0, 1, 0];    % Green for mid densities
high_d_color = [1, 0, 0];   % Red for high densities
whi_color = [1, 1, 1];

low_d_p = water_d < (min_w_d + (max_w_d - min_w_d) / 3);
mid_d_p = water_d >= (min_w_d + (max_w_d - min_w_d) / 3) & ...
                      water_d < (min_w_d + 2 * (max_w_d - min_w_d) / 3);
high_d_p = water_d >= (min_w_d + 2 * (max_w_d - min_w_d) / 3);

    figure;
    axis([0 cWidth 0 cHeight]);
    title('Sand Particle Simulation in Different Water Densities');
    xlabel('Width');
    ylabel('Height');
    hold on;

        plot(positions(low_d_p, 1), positions(low_d_p, 2), '.', 'Color', low_d_color, 'MarkerSize', 10);
        plot(positions(mid_d_p, 1), positions(mid_d_p, 2), '.', 'Color', mid_d_color, 'MarkerSize', 10);
        plot(positions(high_d_p, 1), positions(high_d_p, 2), '.', 'Color', high_d_color, 'MarkerSize', 10);

for t = 1:numSteps
        plot(positions(low_d_p, 1), positions(low_d_p, 2), '.', 'Color', whi_color, 'MarkerSize', 10);
        plot(positions(mid_d_p, 1), positions(mid_d_p, 2), '.', 'Color', whi_color, 'MarkerSize', 10);
        plot(positions(high_d_p, 1), positions(high_d_p, 2), '.', 'Color', whi_color, 'MarkerSize', 10);

    vels(:,2) = vels(:,2) - drag_coef * vels(:,2);

    vels(:,2) = vels(:,2) + settling_vels * timeStep;
    positions(:,2) = positions(:,2) + vels(:,2) * timeStep;

    atBottom = positions(:,2) < 0;
    vels(atBottom, 2) = 0;
    positions(atBottom, 2) = 0;

        plot(positions(low_d_p, 1), positions(low_d_p, 2), '.', 'Color', low_d_color, 'MarkerSize', 10);
        plot(positions(mid_d_p, 1), positions(mid_d_p, 2), '.', 'Color', mid_d_color, 'MarkerSize', 10);
        plot(positions(high_d_p, 1), positions(high_d_p, 2), '.', 'Color', high_d_color, 'MarkerSize', 10);
    
    pause(0.05);
end

% EOF
