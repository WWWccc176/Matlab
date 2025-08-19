clc
clear
f = @(x) 1./(1+25*x.^2);%龙格现象
xx = -1:0.01:1;
plot(xx, f(xx)); hold on
for n = 4:2:12
    x = -1:(2/n):1;
    y = f(x);
    yy = lagrange(x,y,xx);
    plot(xx,yy,'--');
end