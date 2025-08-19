function c = legendreprj(f,n,m)
% orthogonal projection w.r.t w(x)=1 on [-1,1]
% Assume that f is defined on [-1,1].
x = linspace(-1,1,m+1)'; x = x(2:end);
L = zeros(m,n+1); L(:,1) = 1; L(:,2) = x;
for k=2:n
    L(:,k+1) = (2*k+1)/(k+1)*x.*L(:,k)-k/(k+1)*L(:,k-1);
end
k=(0:n)';
c = (2*k+1)/2/m.*(L'*f(x));