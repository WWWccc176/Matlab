syms y(t)
ode = diff(y, t) == -0.5*y + t^2 + 4*t;
cond = y(0) == 1;
ySol(t) = dsolve(ode, cond);
disp('Exact solution:');
disp(ySol(t));
% Parameters
h = 0.1; % Step size
t = 0:h:10; % Time vector from 0 to 10 with step size h
y = zeros(size(t)); % Initialize y vector
y(1) = 1; % Initial condition

% Euler's method
for i = 1:length(t)-1
    y(i+1) = y(i) + h * (-0.5*y(i) + t(i)^2 + 4*t(i));
end

% Plotting the result
figure;
plot(t, y, '-o');
xlabel('t');
ylabel('y');
title('Solution of ODE using Euler''s Method');
grid on;
% Define the ODE as a function
odeFun = @(t, y) -0.5*y + t^2 + 4*t;

% Solve the ODE using ode45
[tSol, ySol] = ode45(odeFun, [0 10], 1);

% Plotting the result
figure;
plot(tSol, ySol, '-o');
xlabel('t');
ylabel('y');
title('Solution of ODE using ode45');
grid on;
