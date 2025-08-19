function [X,A] = hermitediv(x,y,yp,ip)
%yp =y'(x(ip))
i = 1:numel(x); [i,I] = sort([i ip]); 
X = x(i); Y = y(i); X = X(:); Y = Y(:);
n = numel(X);
A = zeros(n,n) + 0*X(1);
A(:,1) = Y(:);
A(:,2) = [0; diff(y(:))./diff(x(:)); yp(:)];
A(:,2) = A(I,2);
for k = 3:n
    A(k:end,k) = (A(k:end,k-1)-A(k-1:end-1,k-1))./(X(k:end)-X(1:end-k+1));
end
