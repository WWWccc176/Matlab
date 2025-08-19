function [t, y] = rkstep(f,a,b,n,ya)
% Classical Runge-Kutta explicit time-stepping for 
% y'=f(t,y), y(a) = ya

t = zeros(n+1,1); t(1) = a; 
h = (b-a)/n; d = numel(ya);
y = zeros(n+1,d); y(1,:) = ya;
for i = 1:n
    k1 = h*f(t(i),y(i,:));
    k2 = h*f(t(i)+h/2,y(i,:)+k1/2);
    k3 = h*f(t(i)+h/2,y(i,:)+k2/2);
    k4 = h*f(t(i)+h,y(i,:)+k3);
    y(i+1,:) = y(i,:) + (k1+2*k2+2*k3+k4)/6;
    t(i+1) = t(i) + h;
end