function [q,e,x]=adapmid(f,a,b,tol)
%ADAPMID integrates a function on a bounded interval to a given accuracy 
%  using the adaptive mid-point rule.
%  q = adapmid(f,a,b) computes the integral within 1e-15 accuracy.
%  [q,e,x] = adapmid(f,a,b) returns also the estimated error e and points x
%  ... = adapmid(f,a,b,tol) sets also the accuracy to tol.

if nargin<4
    tol = 1e-15;
end
c = (a+b)/2;
Tab = (b-a)*(f((a+b)/2));
Tac = (c-a)*(f((a+c)/2));
Tcb = (b-c)*(f((c+b)/2));
e = abs(Tab - Tac - Tcb)/3;
if e < tol
   q = Tac + Tcb; x = [a;c;b];
   return;
else
    [qac, eac, xac] = adapmid(f,a,c,tol/2);
    [qcb, ecb, xcb] = adapmid(f,c,b,tol/2);
    q = qac + qcb;
    e = eac + ecb;
    x = [xac(1:(end-1)); xcb];
end

end % function adapmid