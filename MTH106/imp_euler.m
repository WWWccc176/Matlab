function [t, y] = imp_euler(fun, tspan, y0, h)
t = tspan(1):h:tspan(2);
nt = length(t);
y = zeros(1,nt);
y(1) = y0;
for i = 1:nt-1
    s1 = fun(t(i), y(i));
    s2 = fun(t(i) + h/2, y(i) + h/2 * s1);
    y(i+1) = y(i) + h * s2;
    t(i+1) = t(i) + h;
end