% MATLAB code to plot original function, Taylor expansion, and their error
% Without using Symbolic Math Toolbox (requires pre-calculated Taylor polynomial)

% Clear workspace, command window, and close figures
clear;
clc;
close all;

% --- Define the original function using a numeric function handle ---
% This uses element-wise operators (.*, .^, etc.) which are suitable for array inputs
f_numeric = @(x) exp(-(1/20)*x.^2) .* cos(5*x);

% --- Define the Taylor series expansion (Order 30) using a numeric function handle ---
% This polynomial was PRE-CALCULATED (e.g., using Symbolic Math Toolbox or other tools)
% The function is even, so only even powers are present up to x^30.
% Coefficients obtained from Taylor expansion of exp(-x^2/20)*cos(5x) at x=0 up to order 30.
T_numeric = @(x) 1 - (251/20)*x.^2 ...
                   + (26735295125/831849344)*x.^6 ...
                   - (5347059025/6654794752)*x.^8 ...
                   + (26735295125/3327397376)*x.^10 ...
                   - (5347059025/13309589504)*x.^12 ...
                   + (26735295125/6654794752)*x.^14 ...
                   - (5347059025/26619179008)*x.^16 ...
                   + (26735295125/13309589504)*x.^18 ...
                   - (5347059025/53238358016)*x.^20 ...
                   + (26735295125/26619179008)*x.^22 ...
                   - (5347059025/106476716032)*x.^24 ...
                   + (26735295125/53238358016)*x.^26 ...
                   - (5347059025/212953432064)*x.^28 ...
                   + (26735295125/106476716032)*x.^30;

taylor_order = 30; % Keep this for display purposes in titles/legends

% --- Plotting Part 1: Original Function and Taylor Expansion ---
% Define the x-range and step size for the first plot
x1 = -10:0.05:10;

% Evaluate the functions numerically
y_orig1 = f_numeric(x1);
y_taylor1 = T_numeric(x1);

% Create a figure and the first subplot
figure; % Create a new figure window
subplot(2,1,1); % Create a 2x1 grid of subplots, select the first one

% Plot the original function and the Taylor expansion
plot(x1, y_orig1, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Original Function');
hold on; % Keep the current plot active to add more plots
plot(x1, y_taylor1, 'r--', 'LineWidth', 1.5, 'DisplayName', sprintf('Taylor Expansion (Order %d)', taylor_order));
hold off; % Release the plot hold

% Add title, labels, and legend for the first subplot
title('Original Function and Taylor Expansion');
xlabel('x');
ylabel('y');
legend('show');
grid on;
xlim([-10, 10]); % Ensure x-axis limits are exactly [-10, 10]
ylim([-1.5, 1.5]); % Adjust y-axis limits if needed based on the function behavior

% --- Plotting Part 2: Error between the two functions ---
% Define the x-range and step size for the second plot
x2 = -10:0.1:10;

% Evaluate the functions numerically for the second x-range
y_orig2 = f_numeric(x2);
y_taylor2 = T_numeric(x2);

% Calculate the absolute error
error_val = abs(y_orig2 - y_taylor2);

% Select the second subplot
subplot(2,1,2); % Select the second plot in the 2x1 grid

% Plot the absolute error
plot(x2, error_val, 'k-', 'LineWidth', 1); % Black solid line for error
% semilogy(x2, error_val, 'k-', 'LineWidth', 1); % Uncomment this line to use a logarithmic y-axis for error

% Add title, labels for the second subplot
title('Absolute Error |Original - Taylor Expansion|');
xlabel('x');
ylabel('Absolute Error');
grid on;
xlim([-10, 10]); % Ensure x-axis limits are exactly [-10, 10]
% ylim([0, max(error_val)*1.1]); % Adjust y-axis limit based on calculated error

% Optional: Add a super title to the figure
sgtitle(sprintf('Function and Taylor Expansion vs. Error (Order %d)', taylor_order));
