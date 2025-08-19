f = @(x) cos(5*pi*x)./(2+sin(2*pi*x));
x = 0:0.125:1; y = f(x); xx = 0:0.002:1;
yy2 = cubicspline(x,y,xx,2); yy3 = cubicspline(x,y,xx,3);
plot(xx,f(xx),xx,yy2,'--',x,y,'o',xx,yy3,'-.');