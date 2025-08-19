% How regularity influences convergence

LW = 'linewidth'; lw = 2;
FS = 'fontsize'; fs = 16;
% (a)
%f = @(x) exp(-sin(x));
% (b)
%f = @(x) x.^(5/2);
% (c)
%f = @(x) x.^(3/2);
% (d)
%f = @(x) x.^(1/2);
% (e) only open Newton-Cotes can work, or discard the 1st subinterval
% f = @(x) 1./sqrt(x);
% (f) only open Newton-Cotes can work, or discard the 1st subinterval
f = @(x) 1./nthroot(x.^2,3);
% (g)
%f = @(x) nthroot(x,3);
% (h)
%f = @(x) 2*(x>1/3).*sqrt(x-1/3).^3-(x<1/3).*sqrt(1/3-x).^3;

% set the interval
a = 0; b = 1;

% compute the quadrature 
tol = 1e-5; 
Q = zeros(50,1); % save the quadratures
k = 1; 
while true
    Q(k) = fejer1(f,a,b,1,2^k);%monte(f,a,b,2^k);
    if (k>1 && abs(Q(k)-Q(k-1))<tol) || 2^k>1e8
        break;
    end
    k = k+1;
end
Q = Q(1:k);

% set the exact integral value
% (a)
%I = Q(end);
% (b)
%I = 2/7;
% (c)
%I = 2/5;
% (d)
%I = 2/3;
% (e)
%I = 2;
% (f)
I = 3;
% (g)
%I = 3/4;
% (h)
%I = 16*sqrt(6)/135-2*sqrt(3)/135;

% compute the error
E = abs(Q(1:k)-I);
m = 2.^(1:k);
h = (b-a)./m;
%loglog(h,E,'*-',LW,lw);
loglog(m,E,'*-',LW,lw);
hold on;
%loglog(h,h.^(1/2),LW,lw);
%legend('error', 'h^{1/2}','fontsize',18);
loglog(m,m.^(-2/3),LW,lw);
legend('error', 'm^{-2/3}','fontsize',18);
set(gca,FS,fs); grid on; xlabel('m');
hold off; shg;