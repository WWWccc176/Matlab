function p = leastSquare(x, y)
x_bar = mean(x);
y_bar = mean(y);
nu = 0;
de = 0;
for i = 1:length(x)
    nu = nu + (x(i) - x_bar)*(y(i) - y_bar);
    de = de + (x(i) - x_bar)^2;
end
p(1) = nu/de;
p(2) = y_bar-p(1)*x_bar;
end