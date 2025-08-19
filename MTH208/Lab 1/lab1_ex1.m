clear;
clc
% lab1_ex1
for n = 1:25
    xn = n^2*sin(n^2);
end
xn

n=10;
clear A
for i=1 : n
    A(i, 1)=1;
    A(i, i)=1;
    for j=2: i-1
        A(i, j)=A(i-1, j-1)+A(i-1, j);
    end
end
A