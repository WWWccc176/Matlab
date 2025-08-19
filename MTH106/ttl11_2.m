clear;
data = randn (1, 1000000);
a = quantile(data, [0.25 0.5 0.75]);
disp(a);