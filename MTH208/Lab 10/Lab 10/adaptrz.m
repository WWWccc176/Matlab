function [q,e,x]=adaptrz(f,a,b,tol)
%ADAPTRZ integrates a function on a bounded interval to a given accuracy 
%  using the adaptive trapezium rule.
%  q = adaptrz(f,a,b) computes the integral within 1e-15 accuracy.
%  [q,e,x] = adaptrz(f,a,b) returns also the estimated error e and points x.
%  ... = adaptrz(f,a,b,tol) sets also the accuracy to tol.

if nargin<4
    tol = 1e-15;
end
c = (a+b)/2;
Tab = 0.5*(b-a)*(f(a)+f(b));
Tac = 0.5*(c-a)*(f(a)+f(c));
Tcb = 0.5*(b-c)*(f(c)+f(b));
e = abs(Tab - Tac - Tcb)/3;
if e < tol
   q = Tac + Tcb;
   x = [a;c;b];
   return;
else
    [qac, eac, xac] = adaptrz(f,a,c,tol/2);
    [qcb, ecb, xcb] = adaptrz(f,c,b,tol/2);
    q = qac + qcb;
    e = eac + ecb;
    x = [xac(1:(end-1)); xcb];
end

end % function adaptrz