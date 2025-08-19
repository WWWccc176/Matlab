function [yy, T] = neville(x,y,xx)
% works only for a scalar xx
n = numel(x); T = zeros(n);
disp('-----------------------------------')
disp('Neville Method')
disp('-----------------------------------')
disp('          x             y             ')
disp('-----------------------------------')
for i = 1:n
    T(i,1) = y(i);
    for j=1:i-1
        T(i,j+1)=((x(i)-xx)*T(i-1,j)+(xx-x(i-j))*T(i,j))/(x(i)-x(i-j));
    end
end
disp(formattedDisplayText([x(:) T],'NumericFormat','shortG'));
yy = T(n,n);