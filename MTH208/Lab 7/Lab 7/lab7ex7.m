% Minimax by Remez
f = @(x) sin(pi*x) + 3*exp(-50*(x-0.5).^2);
xc = logspace(log10(0.46),log10(0.55),500);
x = [-1:0.01:0.45 xc 0.56:0.01:1]'; hold on;
for n=[5 10 20]
    [c, E] = chebremez(f,n);
    y = chebval(c,x);
    plot(x,f(x)-y,'linewidth',2);
end
k = (0:n)'; xi = cos((2*k+1)*pi/(2*n+2));
y = lagrange(xi,f(xi),x);
plot(x,f(x)-y,'linewidth',2);
set(gca,'fontsize',16);
legend('f-p_5','f-p_{10}','f-p_{20}','f-chebp_{20}','fontsize',18);