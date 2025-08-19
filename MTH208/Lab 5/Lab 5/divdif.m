function A = divdif(x,y)
% A is the lower triangular matrix of divided differences including the
% zeroth divided differences i.e. the function values y

n = numel(x); x = x(:);
A = zeros(n,n) + 0*x(1);
A(:,1) = y(:);
for k = 2:n
    A(k:end,k) = (A(k:end,k-1)-A(k-1:end-1,k-1))./(x(k:end)-x(1:end-k+1));
end
