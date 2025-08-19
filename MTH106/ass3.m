% load the data
satisfaction = [69 78 97 81 42 45 27 89 74 59 54 90 87 ...
99 86 72 84 40 50 52 61 30 55 80 78 30 76 75 60 53]'; 
severity = [49 23 45 49 59 61 63 39 45 53 37 31 33 32 ...
34 50 62 72 60 39 42 65 32 43 39 64 38 46 52 38]';
%(a) scatter plot
figure;
scatter(severity, satisfaction, 'filled');
title('Scatter Plot of Satisfaction vs Severity');
xlabel('Severity');
ylabel('Satisfaction');
grid on;
% (b) linear regression model
X = [ones(length(severity), 1), severity]; % add constant term
Y = satisfaction;
coeffs = X \ Y; % regression coefficient (b0 and b1)
b0 = coeffs(1); % intercept
b1 = coeffs(2); % slope
% Regression line equation
y_pred = X * coeffs;
% Plot the regression line
hold on;
plot(severity, y_pred, 'r-', 'LineWidth', 1.5);
legend('Data', 'Regression Line');
% Output regression equation and R^2
SS_tot = sum((Y - mean(Y)).^2); % total sum of squares
SS_res = sum((Y - y_pred).^2); % residual sum of squares
R2 = 1 - SS_res / SS_tot; % determination coefficient
fprintf('Regression Line: y = %.2f + %.2f * x\n', b0, b1);
fprintf('R^2: %.4f\n', R2);
% (c) residual analysis
residuals = Y - y_pred;
% Plot residuals
figure;
subplot(2, 2, 1);
scatter(y_pred, residuals, 'filled');
title('Residuals vs Predicted');
xlabel('Predicted Values');
ylabel('Residuals');
grid on;
% Plot the residual histogram
subplot(2, 2, 2);
histogram(residuals, 'Normalization', 'pdf');
title('Histogram of Residuals');
xlabel('Residuals');
ylabel('Density');
% Plot the residual Q-Q plot
subplot(2, 2, 3);
qqplot(residuals);
title('Q-Q Plot of Residuals');
% Plot a residual autocorrelation
subplot(2, 2, 4);
autocorr(residuals);
title('Autocorrelation of Residuals');
% Output estimates of residuals
fprintf('Residual Mean: %.4f\n', mean(residuals));
fprintf('Residual Variance: %.4f\n', var(residuals));