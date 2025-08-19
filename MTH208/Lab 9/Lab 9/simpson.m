function I = simpson(f,a,b,n)
% n must be an even number
% f must be a vectorized function
h = (b-a)/n;
x = linspace(a,b,n+1);
I = f(a)+f(b)+2*sum(f(x(3:2:n-1)))+4*sum(f(x(2:2:n)));
I = I*h/3;

end % end of function simpson
