fun = @(t,y) ((t - y).*t)/2;
y0 = 1;
tspan = [0 0.2];
[t,y] = ode45(fun, tspan, y0);
fprintf('At t=0.2, y=%.6f\n', y(end))
y(end)
a = 0.991377850614058-0.991377848953463
