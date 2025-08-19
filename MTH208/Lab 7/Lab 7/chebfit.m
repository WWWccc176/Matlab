function a = chebfit(x,y,n,epsilon)
x = x(:); % x in [-1,1] is assumed
A = zeros(numel(x),n+1);
A(:,1) = 1; A(:,2) = x;
for k=2:n
    A(:,k+1) = 2*x.*A(:,k)-A(:,k-1);
end
if nargin<4
   a = A\y(:);
else
   a = (A'*A + epsilon*eye(n+1))\(A'*y(:));
end