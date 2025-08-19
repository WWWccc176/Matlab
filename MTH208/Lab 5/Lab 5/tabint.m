% Neville interpolation for the tabulated integral int[0,x] exp(sin(t))
x = 0.4:0.1:0.9;
y = [0.4904  0.6449  0.8136  0.9967  1.1944  1.4063];
xx = 0.66;
[~,I] = sort(abs(x-xx));
x = x(I); y = y(I);
[yy,T] = neville(x,y,xx);

