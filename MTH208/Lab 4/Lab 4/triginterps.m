function [yy, c] = triginterps(a,b,y,xx)
% y corresponds to function values at equally spaced nodes on [a, b)
n = numel(y); c = fft(y(:))/n; t = (xx-a)/(b-a); 
z = exp(1i*2*pi*t);
nh = floor(n/2); yy = c(nh+1)*ones(size(xx));
for k=nh:-1:1
    yy = c(k) + yy.*z;
end
yyl = c(nh+2)*ones(size(xx)); z = conj(z);
for k= nh+3:n
    yyl = c(k) + yyl.*z;
end
yy = yy + yyl.*z;
if isreal(y)
    yy = real(yy);
end