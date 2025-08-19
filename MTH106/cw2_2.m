clear
syms t y(t)
Dy = diff(y,t);
eqn = t*Dy + 3*y == 4*t^2 - 3*t;
cond = y(1) == 4;
ySol(t) = dsolve(eqn,cond)
y_10 = subs(ySol, t, 10)
f = @(t) (16*t.^5 - 15.*t.^4 + 79)./(20.*t.^3);
Area = integral(f, 2, 3)
odefun = @(t, y) (4*t^2 - 3*t - 3*y)/t;
[t, y_h] = ode45(odefun, [1 3], 4);
y_h3 = y_h(end)


