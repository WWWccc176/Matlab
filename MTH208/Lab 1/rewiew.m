clear
clc
format compact
format long

A=randn(3);
[e,v]=eig(A)
a=[1:5;6:10]
b=a.^2 %加点的是元素计算
c=0.1;
d=c+c+c+c+c+c+c+c+c+c;
fprintf('%.100f\n', c+c)
fprintf('%.100f\n', c*2)

g = @(x, y) x.*y + y.^2;
figure;
fsurf(g, [-5 5 -5 5],'EdgeColor', 'none');  % 自动生成网格
xlabel('x');
ylabel('y');
zlabel('z');
title('fsurf 绘图');

syms x;
h_sym = (1 + 1/x)^(1 - 1/(x - 2));  % 符号表达式
dh = diff(h_sym, x);                % 对 x 求导
dh_simplified = simplify(dh);
disp(dh);
disp(dh_simplified);

