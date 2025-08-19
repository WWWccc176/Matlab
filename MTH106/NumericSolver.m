function [t,y] = NumericSolver(fun,time_interval,initial_value,h)
t  = time_interval(1): h :time_interval(2);
n = length(t);
y  = zeros(1,n);
k1 = zeros(1,n);
k2 = zeros(1,n);
k3 = zeros(1,n);
y(1) =  initial_value;
for i = 1: n-1
    k1(i+1) = h*fun(t(i), y(i));
    k2(i+1) = h*fun(t(i)+ h/2 , y(i) +(1/2)* k1(i+1) );
    k3(i+1) = h*fun(t(i)+h, y(i)+2*k2(i+1)-k1(i+1));
y(i+1) =  y(i) + (1/6)*(k1(i+1)+ 4*k2(i+1)+ k3(i+1));
t(i+1) = t(i) + h;
end