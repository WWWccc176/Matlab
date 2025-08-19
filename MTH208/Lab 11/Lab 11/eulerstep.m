function [t, y] = eulerstep(f,a,b,n,ya)
% Euler explicit time-stepping for 
% y'=f(t,y), y(a) = ya

t = zeros(n+1,1); t(1) = a; 
h = (b-a)/n; d = numel(ya);
y = zeros(n+1,d); y(1,:) = ya;
for i = 1:n
    y(i+1,:) = y(i,:) + h*f(t(i),y(i,:));
    t(i+1) = t(i) + h;
end