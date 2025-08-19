function I = mid(f,a,b,n)

h = (b-a)/n;
x = linspace(a,b,n+1);
I = sum(f((x(2:end)+x(1:end-1))/2));
I = I*h;