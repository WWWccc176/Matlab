function [t, y] = trzstep(f,a,b,n,ya)
% Trapezoidal i.e. modified Euler explicit time-stepping for 
% y'=f(t,y), y(a) = ya

t = zeros(n+1,1); t(1) = a; 
h = (b-a)/n; d = numel(ya);
y = zeros(n+1,d); y(1,:) = ya;
for i = 1:n
    y1 = y(i,:) + h*f(t(i),y(i,:));
    y(i+1,:) = y(i,:) + h*(f(t(i),y(i,:))+f(t(i)+h,y1))/2;
    t(i+1) = t(i) + h;
end