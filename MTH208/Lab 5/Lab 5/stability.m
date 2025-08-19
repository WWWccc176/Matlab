% N. Higham, The numerical stability of barycentric Lagrange interpolation
% see stableLagrange.pdf 
n = 29;
%x = linspace(-1,1,n+1); 
x = linspace(0,1,n+1); x = cos(pi*x);
%[x,I] = sort(x,'comparisonmethod','abs'); 
x = flip(x);
%y = zeros(size(x)); y(end) = 1; 
y = 1./(1+25*x.^2);
h = 2*10^3*eps;
xx = linspace(-1+h,1-h,100); 
A = divdif(x,y); yy = newtoninterp(x,diag(A),xx);
yl = lagrange(x,y,xx);

% do again in vpa 
digits(50);
%X = linspace(vpa(-1),vpa(1),n+1); 
X = linspace(vpa(0),vpa(1),n+1); X = cos(pi*X);
%X = X(I); 
X = flip(X);
%Y = vpa(0)*X; Y(end) = vpa(1); 
Y = 1./(1+25*X.^2);
H = 2*vpa(10)^3*vpa(eps);
XX = linspace(-vpa(1)+H,vpa(1)-H,100);
YY = lagrange(X,Y,XX);

% compare
semilogy(xx,abs(yy-YY)./abs(YY),'o')
hold on
semilogy(xx,abs(yl-YY)./abs(YY),'x')