function y = trigval(c,x)
x = x(:); n = floor((numel(c)-1)/2);
A = zeros(numel(x),2*n+1);
A(:,n+1) = 1; w = exp(1i*2*pi*x);
for k=-1:-1:-n
    A(:,n+1+k) = A(:,n+2+k)./w;
end
for k=1:n
    A(:,n+1+k) = A(:,n+k).*w;
end
y = A*c(:);