function [c,E] = chebremez(f,n)
% assume the interval is [-1,1]
%x = linspace(-1,1,n+2)';
k = (0:n+1)'; x = cos((2*k+1)*pi/(2*n+4)); x = flip(x);

while true
    % Step 1. solve the oscillation problem
    A = zeros(n+2,n+2);
    A(:,1) = 1; A(:,2) = x;
    for k=2:n
      A(:,k+1) = 2*x.*A(:,k)-A(:,k-1);
    end
    A(:,end) = (-1).^(0:n+1)';
    c = A\f(x);
    c = c(1:end-1);
    g = @(x)f(x)-chebval(c,x);

    % Step 2.
    % find roots of f-p by bisection
    r = zeros(n+1,1);
    for k=1:n+1
        a = x(k); b = x(k+1);
        r(k) = bisect(g,a,b,1e-10,100);
    end
    % find extrema of f-p by golden section
    tomin = @(x) -g(-1)*g(x);
    x(1) = golden_section(tomin,-1,r(1),1e-10,100);
    tomin = @(x) -g(1)*g(x);
    x(end) = golden_section(tomin,r(end),1,1e-10,100);
    for k=2:n+1
        mi = (r(k-1)+r(k))/2;
        tomin = @(x) -g(mi)*g(x);
        x(k) = golden_section(tomin,r(k-1),r(k),1e-10,100);
    end

    % stopping criterion
    E = abs(g(x));
    if max(abs(diff(E)))<1e-12
        break;
    end

end

