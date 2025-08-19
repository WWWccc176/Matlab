function [t,y] = euler0(fun,tspan,y0,h)
t = tspan(1):h:tspan(2);
nt = length(t);
y = zeros(1,nt);
y(1) = y0;
for i = 1:nt-1
y(i+1) = y(i) + h*fun(t(i),y(i));
t(i+1) = t(i) + h;
end
