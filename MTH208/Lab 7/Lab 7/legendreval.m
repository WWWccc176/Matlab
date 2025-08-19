function y = legendreval(c,x)
x = x(:);
n = numel(c)-1;
L = zeros(numel(x),n+1); L(:,1) = 1; L(:,2) = x;
for k=2:n
    L(:,k+1) = (2*k+1)/(k+1)*x.*L(:,k)-k/(k+1)*L(:,k-1);
end
y = L*c(:);