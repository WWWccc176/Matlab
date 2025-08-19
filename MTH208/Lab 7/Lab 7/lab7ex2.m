% polynomial regression with Chebyshev basis
x = 0:0.01:1;
f = @(x) sin(pi*x);
y = f(x) + 1e-1*randn(size(x)); % add some noise
a = chebfit(x,y,15,1);
yy = chebval(a,x);
plot(x,y,x,yy,'--','linewidth',2)
set(gca,'fontsize',16);
legend('noisy data','fitted polyn','fontsize',18);