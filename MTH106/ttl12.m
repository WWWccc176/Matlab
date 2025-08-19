clear;
x = 0:0.1:0.9;
y = [0 1 60 40 41 47 56 65 78 84];
p_1 = polyfit(x,y, 1);
disp(p_1);
r2_1 = 1 - sum((y - polyval(p_1, x)).^2)/ sum((y - mean(y)).^2);
disp(r2_1);

p_2 = polyfit (x,y, 2);
disp (p_2);
r2_2 = 1 - sum((y - polyval(p_2, x)).^2)/ sum((y - mean(y)).^2);
disp(r2_2);