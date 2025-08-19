function [q,e,x]=adapsimpson(f,a,b,tol)
%ADAPSIMPSON integrates a function on a bounded interval to a given accuracy 
%  using the adaptive Simpson's rule.
%  [q,e,x] = adapmid(f,a,b) returns also the estimated error e and points x

c = (a+b)/2; c1=(a+c)/2; c2=(b+c)/2;
Sab = 1/6*(b-a)*(f(a)+4*f(c)+f(b)); 
Sac = 1/6*(c-a)*(f(a)+4*f(c1)+f(c));
Scb = 1/6*(b-c)*(f(c)+4*f(c2)+f(b)); 
e = abs(Sab - Sac - Scb)/15;
if e < tol
   q = Sac + Scb; x = [a;c1;c;c2;b]; 
   return;
else
    [qac, eac, xac] = adapsimpson(f,a,c,tol/2); 
    [qcb, ecb, xcb] = adapsimpson(f,c,b,tol/2);
    q = qac + qcb;
    e = eac + ecb;
    x = [xac(1:(end-1)); xcb];
end