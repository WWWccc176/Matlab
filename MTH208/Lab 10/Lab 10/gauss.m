function q = gauss(f,a,b,m)

q = 0;
for k = 1:m
    [~, w, x] = glpair(m,k);
    x = (x*(b-a)+a+b)/2; % [-1,1]->[a,b]
    q = q + w*f(x);
end
q = q*(b-a)/2;
