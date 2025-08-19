function yy = newtoninterp(x,a,xx)
% evaluate the Newton polynomial with the coefficient a(0), ...
% associated with the nodes x

n = numel(x)-1;
if n~=numel(a)-1
    error('newtoninterp: x and a are of different length!');
end
yy = a(end)*ones(size(xx));
for k=n:-1:1
    yy = a(k)+(xx-x(k)).*yy;
end


