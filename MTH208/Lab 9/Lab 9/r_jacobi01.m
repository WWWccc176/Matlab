function ab=r_jacobi01(N,a,b)
%R_JACOBI01 Recurrence coefficients for monic shifted Jacobi
%polynomials.
%   AB=R_JACOBI01(N,A,B) generates the Nx2 array AB of the first
%   N recurrence coefficients for monic shifted Jacobi polynomials 
%   orthogonal on [0,1] relative to the weight function 
%   w(x)=(1-x)^A*x^B. The call AB=R_JACOBI01(N,A) is the same as
%   as ab=R_JACOBI01(N,A,A) and AB=R_JACOBI01(N) the same as
%   AB=R_JACOBI01(N,0,0).

if nargin<2, a=0; end;  if nargin<3, b=a; end
if((N<=0)|(a<=-1)|(b<=-1)) error('parameter(s) out of range'), end
cd=r_jacobi(N,a,b);
n=1:N;  ab(n,1)=(1+cd(n,1))./2;  
ab(1,2)=cd(1,2)/2^(a+b+1);
n=2:N;  ab(n,2)=cd(n,2)./4;