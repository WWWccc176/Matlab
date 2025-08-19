x = linspace(-100,100,2000);
h = 20.*x.^2-200.*x+3;
plot(x, h)
fminbnd(@h, -10, 10)
