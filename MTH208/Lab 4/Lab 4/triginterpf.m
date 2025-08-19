function [Y,X] = triginterpf(a,b,y,N)
% evaluate at a + (b-a)*j/N, j=0,..,N-1
n = numel(y); c = fft(y(:))/n; X = linspace(a,b,N+1);
nh = floor(n/2); d = zeros(N,1); d(1:nh+1) = c(1:nh+1); 
d(N-n+nh+2:N) = c(nh+2:n);
Y = N*ifft(d);
if isreal(y)
    Y = real(Y);
end
Y(end+1) = Y(1); 