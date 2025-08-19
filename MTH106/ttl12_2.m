clear
%3.1
x = [28 29 30 37 45 47 52 54 57 60 65 66 72 75 82 88 98];
y = [53 58 62 55 54 62 55 62 70 58 66 55 65 57 67 59 75];
p = polyfit(x, y, 1);
fprintf('a is %f\n', p(2));
fprintf('b is %f\n', p(1));

%3.2
p_2 = our_polyfit(x, y);
fprintf('a_2 is %f\n', p_2(2));
fprintf('b_2 is %f\n', p_2(1));

%3.3
plot (x, y,'.r');
hold on;
y_hat = polyval(p, x);
plot (x, y_hat, '-b');
hold off;

%3.4
r2 = 1 - sum((y - polyval(p, x)).^2)/sum((y - mean(y)).^2);
disp(r2);
se = sqrt((sum(y - polyval(p, x)).^2)/(length(y) - 2));

%3.6
y(80) = p(1)*80+p(2);
disp(y(80));
