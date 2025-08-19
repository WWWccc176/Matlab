function P = nevilleInterp(x, y, xx)
% P = nevilleInterp(x,y,xx)
% 用 Neville 递推公式，在点 xx 上求插值多项式
% x, y: 插值节点，长度 n
% xx: 待求点，长度 m
n = numel(x);
m = numel(xx);
P = zeros(size(xx));
for k = 1:m
    Q = zeros(n,n);
    Q(:,1) = y(:);
    for j = 2:n
        for i = 1:n-j+1
            Q(i,j) = ((xx(k)-x(i+j-1))*Q(i,j-1) + (x(i)-xx(k))*Q(i+1,j-1))...
                     /(x(i)-x(i+j-1));
        end
    end
    P(k) = Q(1,n);
end
end
