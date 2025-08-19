x = linspace(-7, 2.3, 3000);
y = x.^x;
a=imag(y);
b=real(y);
plot3(x,a,b)