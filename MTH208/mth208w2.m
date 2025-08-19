fun = @(x) x^2 - 2;
[p, flag] = bisect(fun, 1, 2, 1e-6, 100);