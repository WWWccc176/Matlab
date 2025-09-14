clear;clc;format compact;
f = @(x) 30*exp(-100*x).*(100*x - 101) + 70;
a = 0.001;   % 避免x=0的奇点
b = 0.35;
tol = 1e-14;
maxIt = 100;
[root, iter] = bisect(f, a, b, tol, maxIt);
disp [root, iter]