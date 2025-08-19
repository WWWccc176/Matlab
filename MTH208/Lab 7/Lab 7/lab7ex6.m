% Legendre for continuous least-squares
f = @(x) sin(pi*x) + 3*exp(-50*(x-0.5).^2);
xc = logspace(log10(0.46),log10(0.55),500);
x = [-1:0.01:0.45 xc 0.56:0.01:1]';
c = legendreprj(f,5,1e7);
y = legendreval(c,x);
plot(x,f(x),x,y,'--','linewidth',2);
c = legendreprj(f,10,1e7);
y = legendreval(c,x);
hold on; plot(x,y,'--','linewidth',2);
set(gca,'fontsize',16);
legend('f','p_5','p_{10}','fontsize',18);

