clear
syms y(t)
Dy = diff(y, t);
D2y = diff(y, t, t);
ode = D2y + 2*Dy + y == 2*sin(t);

cond1 = y(0) == 0;
cond2 = Dy(0) == 1;

ySolSymbolic = dsolve(ode, [cond1, cond2])

odeFun = @(t, y) [y(2); -2*y(2) - y(1) + 2*sin(t)];
initialConditions = [0; 1];

[tSol, ySol] = ode45(odeFun, [0 4*pi], initialConditions);

subs(ySolSymbolic, t, 4*pi)
vpa(ySolSymbolic, 8)

fplot(matlabFunction(ySolSymbolic), [0 4*pi]);
hold on;


plot(tSol, ySol(:, 1), 'o');

legend('Symbolic Solution', 'Numerical Solution', 'Location', 'Best');
title('Comparison of Symbolic and Numerical Solutions to the ODE');
xlabel('t');
ylabel('y(t)');

hold off;