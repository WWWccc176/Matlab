% antiderivative using Chebyshev differentiation matrix
f = @(x) exp(-x.^2/2)/sqrt(2*pi);
F = @(x) (1+erf(x/sqrt(2)))/2;
[D,x] = chebdmat(-10,10,50);
D(1,:) = 0; D(1,1) = 1;
y = f(x); y(1) = 0; Y = D\y;
plot(x,F(x)-Y,'*','linewidth',2);
set(gca,'fontsize',18);
hold on;
xx = linspace(-10,10,1e4);
YY = lagrange(x,Y,xx);
plot(xx,F(xx)-YY,'linewidth',2);
legend('nodal error','all error','fontsize',18);