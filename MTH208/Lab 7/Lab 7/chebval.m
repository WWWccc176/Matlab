function y = chebval(a,x)
x = x(:); % x in [-1,1] is assumed
n = numel(a)-1;
A = zeros(numel(x),n+1);
A(:,1) = 1; A(:,2) = x;
for k=2:n
    A(:,k+1) = 2*x.*A(:,k)-A(:,k-1);
end
y = A*a(:);