f = @(x) cos(1.9*pi*x).^2;
x = 0:0.125:1; y = f(x); xx = 0:0.002:1;
yy = cubicspline(x,y,xx,2);
plot(xx,f(xx),xx,yy,'--',x,y,'o');