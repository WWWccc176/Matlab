clear;
N = 10000000;
s = 3000 + 150*randn(N, 1);
Re = mean(max(s- 3000, 0));
disp(Re);