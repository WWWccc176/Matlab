clear;
z = 1:9;
y = [51 76 105 120 158 183 214 250 301];
x = exp(z);
p = polyfit(x, y, 1);
fprintf('a 1s %f\n',p(1));
fprintf('b is %f\n', p(2));
y_hat = polyval(p,x);
plot (x, y)
legend('y')
hold on;
plot (x, y_hat)
legend('y_hat')
hold on;
figure
plot (z, y)
legend('y')
hold on;
plot (z, y_hat)
legend('y_hat')
hold off