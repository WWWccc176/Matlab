function D = dmat(x)

n = numel(x)-1;
x = x(:);
D = x - x'; D = D + eye(n+1);
a = prod(D,2);
D = (a*(1./a'))./D;
for i=1:n+1
    D(i,i) = 0;
    D(i,i) = - sum(D(i,:));
end

