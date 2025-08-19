% Define the joint PDF h(x, y, alpha)
h = @(x, y, alpha) (1/sqrt(2*pi)) * exp(-x.^2 / 2) .* (alpha * exp(-alpha * y)) .* (y >= 0);
% Define alpha
alpha = 1;

% Define the limits of integration
x_lower = -2;
x_upper = 2;
y_lower = -2;
y_upper = 2;

% Calculate the joint probability
joint_prob = integral2(@(x, y) h(x, y, alpha), x_lower, x_upper, y_lower, y_upper);
disp(['The joint probability P(-2 <= X <= 2, -2 <= Y <= 2) for alpha = 1 is ', num2str(joint_prob)]);
% Define the region for plotting
[x, y] = meshgrid(-3:0.1:3, -3:0.1:3);

% Calculate h(x, y) for plotting
alpha = 1;
z = h(x, y, alpha);

% Plot the surface
figure;
surf(x, y, z);
xlabel('x');
ylabel('y');
zlabel('h(x, y)');
title('Surface plot of the joint PDF h(x, y)');

% Plot the contour lines
figure;
contour(x, y, z);
xlabel('x');
ylabel('y');
title('Contour plot of the joint PDF h(x, y)');

% Calculate the gradient
[dx, dy] = gradient(z, 0.1, 0.1);

% Plot the gradient
figure;
quiver(x, y, dx, dy);
xlabel('x');
ylabel('y');
title('Gradient of the joint PDF h(x, y)');
