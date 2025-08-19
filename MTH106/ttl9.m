%1
a = [23 25 26 25 27 25 24 22 23 25 26 26 24 24 22 25 26 24 24 24 27 23];
binwidth = .5;
mean = sum(a)/length(a)
b = std(a)
upper_limit = mean+b
lower_limit = mean-b
x = 21:28;
histogram(a,x)
