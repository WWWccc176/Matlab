function yy = bernstein(a,b,y,xx)

n = numel(y) - 1;
yy = zeros(size(xx));
for k = 0:n
    yy = yy + y(k+1)*nchoosek(n,k)*(xx-a).^k.*(b-xx).^(n-k)/(b-a)^n; 
end