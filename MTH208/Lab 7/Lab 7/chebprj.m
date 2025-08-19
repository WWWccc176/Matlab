function c = chebprj(f,n,m)
% orthogonal projection w.r.t w(x)=1/sqrt(1-x^2)/pi on [-1,1]
% Assume that f is defined on [-1,1].
t = linspace(0,1,m+1); t = t(2:end)*pi;
k = (0:n)'; 
c = 1/m*cos(k*t)*f(cos(t'));
c(2:end) = c(2:end)*2;

