%1
integrand1 = @(x) (1/(2*sqrt(2*pi))*exp(-(x-3).^2/(2*4)));
probability = integral(integrand1, 1,2)
%2
integrand2 = @(x,y) x.*y;
re = integral2(integrand2,-2,2,-1,3)
%3
integrand3 = @(x,y) ones(size(x));
xmin = 0; xmax = 1;
ymin = 0; ymax = @(x) sqrt(1 - x.^2); 
integral2(integrand3,xmin,xmax,ymin,ymax)
%4
x = -pi:pi/20:2*pi;
y = sin(x);
appintegral = trapz(x,y)
%5
f = @(x) 1/sqrt(2*pi)*exp(-x.^2/2);
re1 = integral(f,2,inf)
%6
a = 10000000;
b = 2:.2:a;
c = f(b);
re2 = trapz(b,c);
err = re2-re1
%7
diff([12 23 45 56 7 54])
%8
h = 0.01;
d = 3;
D = [d d+h];
g = @(x) exp(x);
G = g(D);
derivative = diff(G)/diff(D)
