function I = monte(f,a,b,m)

s = 1e4; % maximum samples each time
if m<s
    x = a+(b-a)*rand(m,1);
    I = sum(f(x))/m;
else
    I = 0;
    for i=1:floor(m/s)
        x = a+(b-a)*rand(s,1);
        I = I + sum(f(x));
    end
    x = a+(b-a)*rand(mod(m,s),1);
    I = I + sum(f(x));
    I = I/m;
end