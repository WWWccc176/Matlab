x = [2,3,7,9,10,10,12,15,16,20];
y = [10,11,13,14,18,20,20,22,22,26];
% p = polyfit(x,y,1); % p(1) is b, p(2) is a
p = leastSquare(x, y);
y_hat = p(1)*x+p(2);
plot(x, y, 'or', x, y_hat, '-.b', x, y_hat-2*se, '--.b', x, y_hat+2*se,'--.b')
hold on
figure
eps = y - y_hat;
plot(x, eps,'o')
r2 = 1 - sum(eps.^2)/sum((y - mean(y)).^2)
se = sqrt(sum(eps.^2)/(length(x)-2))