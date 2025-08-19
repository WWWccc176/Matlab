function [D,x]=chebdmat(a,b,n)
% assume a<b
t = linspace(0,1,n+1); t = flip(cos(pi*t'));
j = 0:n;
D = (t - t') + eye(n+1);
D = (-1).^(j'+j)./D;
D(2:n,[1,n+1]) = D(2:n,[1,n+1])/2;
D([1,n+1],2:n) = D([1,n+1],2:n)*2;
D(1,1) = -(2*n^2+1)/6; 
D(n+1,n+1) = (2*n^2+1)/6;
for j=2:n
    %D(j,j) = -t(j)/2/(1-t(j)^2);
    D(j,j) = 0; D(j,j) = -sum(D(j,:));
end
x = (a+b + t*(b-a))/2;
D = 2/(b-a)*D;
