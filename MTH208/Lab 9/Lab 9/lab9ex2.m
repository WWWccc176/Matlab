% quadrature in finance
format long
r = 0.1; tau = 1; sigma = 0.2; K = 100; x = 100;
z = log(x); 
f = @(xi) exp(-r*tau)*(exp(xi)-K)/sqrt(2*pi*sigma^2*tau) ...
    .*exp(-1/(2*sigma^2*tau)*(xi-z-(r-sigma^2/2)*tau).^2);
c1 = simpson(f,log(K),log(400),1e4)
c2 = simpson(@(t)vanopt(t,r,tau,sigma,K,z),0,1/K,1e4)
c = 13.26967658466089

