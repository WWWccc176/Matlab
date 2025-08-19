function c = trigfit(x,y,n)
x = x(:);
A = zeros(numel(x),2*n+1);
A(:,n+1) = 1; w = exp(1i*2*pi*x);
for k=-1:-1:-n
    A(:,n+1+k) = A(:,n+2+k)./w;
end
for k=1:n
    A(:,n+1+k) = A(:,n+k).*w;
end
c = A\y(:);