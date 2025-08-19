function [x,fx,iter,nfeval,nDfeval,fvec] = ...
        SteepestDescent(f,Df,x0,tol,maxit,linsea,fmin)
% SteepestDescent tries to find a local minimum of a given function from R^n to
% R by the steepest descent method
%
% [x,fx,iter,nfeval,nDfeval,fvec] =
% SteepestDescent(f,Df,x0,tol,maxit,linsea,fmin) accepts the function f, its
% gradient Df, initial vector x0, tolerance for |Df|<tol and maximum iterations
% maxit and optionally a string linsea indicating to use which line search
% method and a known minimized function value, and returns the final solution x
% and f(x) and optionally number of iterations, number of times that f and Df
% are evaluated and all the historical f values 'fvec'

if nargin>6 && ~isempty(fmin)
    has_fmin = true;
else
    has_fmin = false;
end
if nargin<6 || isempty(linsea)
    linsea = 'exact';
end
if strcmp(linsea,'wolfe')
    pars.fgname = @(x,pars) deal(f(x),Df(x));
end
x = x0; fx = f(x); Dfx = Df(x); p = -Dfx; nDfeval = 1; nfeval = 1;
fvec = zeros(maxit+1,1); iter = 0;
while iter<maxit && ((~has_fmin && norm(Dfx)>=tol) || (has_fmin && abs(fx-fmin)>=tol) )
    Dfx0 = Dfx; fvec(iter+1) = fx;
    %  line search for a step length and update x, p, fx, Dfx
    switch linsea
      case 'wolfe',
        [a,x,fx,Dfx,fail,~,nsteps] = linesch_ww(x,fx,Dfx'*p,p,pars,1e-4,0.9);
        if fail
            error('SteepestDescent: linsch_ww failed to find a step length!');
        end
        nfeval = nfeval + nsteps; nDfeval = nDfeval + nsteps;
        p = -Dfx;
      case 'backtrack',
        [a,x,fx,nf] = backtrack(fx,Dfx,x,f,Dfx'*p,p,20,0.5,1e-2);
        nfeval = nfeval + nf;
        Dfx = Df(x); nDfeval = nDfeval + 1;
        p = -Dfx;
      otherwise,
        [a,fx,~,output] = fminbnd(@(a)f(x+a*p),0,20);
        neval = neval + output.funcCount;
        x = x + a*p;
        Dfx = Df(x); nDfeval = nDfeval + 1;
        p = -Dfx;
    end
    iter = iter + 1;
end
fvec = fvec(1:iter+1); fvec(end) = fx;
