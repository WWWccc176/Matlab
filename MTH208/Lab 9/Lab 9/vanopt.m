function y = vanopt(t,r,tau,sigma,K,z)

tis0 = (t.^2==0);
y(tis0) = 0;
y(~tis0) = exp(-r*tau).*(1-K*t)/sqrt(2*pi*sigma^2*tau) ...
    .*exp(-1/(2*sigma^2*tau)*(-log(t)-z-(r-sigma^2/2)*tau).^2) ...
    ./t.^2;

end