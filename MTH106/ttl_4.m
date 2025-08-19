clear;
N = 10000000;
x = rand(N, 1);
re_1 = sqrt (2*pi) *mean (x.^2 + 1);
disp(re_1);
f = @(x) (x.^2+1).*exp((-x.^2)/2);
re_2 = integral(f, - inf, inf);
disp(re_2);
X = -10000:10000;

re_3 = trapz(X, (X.^2+1).*exp((-X.^2) /2));
disp(re_3);