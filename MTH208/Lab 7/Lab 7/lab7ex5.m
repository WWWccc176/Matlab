% Chebyshev continuos least squares
f = @(x) 1./(1+25*x.^2); n = 10;
c = chebprj(f,n,1000);
x = -1:0.01:1;
y = chebval(c,x);
plot(x,f(x),x,y,'--','linewidth',2);
set(gca,'fontsize',16);

% discrete least squares with random samples 
t = rand(101,1)*pi;
a = chebfit(cos(t),f(cos(t)),n);
yy = chebval(a,x);
hold on;
plot(x,yy,':','linewidth',2);
legend('f','continuous','discrete','fontsize',18)