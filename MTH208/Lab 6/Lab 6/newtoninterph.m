function [yy,yyp] = newtoninterph(x,a,xx)
% Newton interpolation from the divided differences 'a'.
% Return also the derivative values.
n = numel(x)-1;
if n~=numel(a)-1
    error('newtoninterph: x and a are of different length!');
end
yy = a(end)*ones(size(xx)); yyp = 0*yy;
for k=n:-1:1
    yyp = yy+(xx-x(k)).*yyp;
    yy = a(k)+(xx-x(k)).*yy;
end