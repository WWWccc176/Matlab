% MATLAB code to simulate and plot a single SDE path using Euler-Maruyama

% Clear workspace, command window, and close all figures
clear;
clc;
close all;

% --- Define SDE Parameters ---
% SDE form: dY_t = mu(t, Y_t) * dt + sigma(t, Y_t) * dB_t

% For Arithmetic Brownian Motion: dY_t = a * dt + sigma * dB_t
a = 1;       % Drift coefficient (mu = a)
sigma = 2;   % Diffusion coefficient (sigma)

% Define the drift and diffusion functions as anonymous functions
% They take time t and current value Y_t as input
mu_func = @(t, Y) a;
sigma_func = @(t, Y) sigma;

% --- Simulation Parameters ---
Y0 = 0;       % Initial value of Y_t
T_start = 0;  % Start time
T_end = 10;   % End time
N_steps = 1000; % Number of time steps (determines the step size dt)

% --- Simulation ---

% Calculate time step size
dt = (T_end - T_start) / N_steps;

% Create time vector
t = T_start:dt:T_end;

% Initialize the result array for Y_t values
Y = zeros(1, N_steps + 1);
Y(1) = Y0; % Set the initial value

% Loop through the time steps
for i = 1:N_steps
    % Get current time and value
    current_t = t(i);
    current_Y = Y(i);

    % Calculate drift and diffusion values at current time and value
    mu_val = mu_func(current_t, current_Y);
    sigma_val = sigma_func(current_t, current_Y);

    % Generate a random number for the Brownian motion increment
    % dB_t ~ N(0, dt), so dB_t = sqrt(dt) * Z where Z ~ N(0, 1)
    Z = randn(); % Standard normal random number

    % Apply the Euler-Maruyama update rule
    % Y(k+1) = Y(k) + mu(t_k, Y_k) * dt + sigma(t_k, Y_k) * sqrt(dt) * Z_k
    Y(i+1) = current_Y + mu_val * dt + sigma_val * sqrt(dt) * Z;
end

% --- Plotting ---
figure; % Create a new figure window
plot(t, Y); % Plot the simulated path
xlabel('Time (t)');
ylabel('Process Value (Y_t)');
title('Simulated SDE Path (Arithmetic Brownian Motion via Euler-Maruyama)');
grid on;

% You can run this code multiple times to see different random paths
