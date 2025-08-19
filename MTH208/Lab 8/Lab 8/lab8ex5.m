%
ifun = 3;
switch ifun
  case 1
    f = @(x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
    Df = @(x) [200*(x(2)-x(1)^2)*(-2*x(1))-2*(1-x(1)); 200*(x(2)-x(1)^2)];
    D2f = @(x) [1200*x(1)^2-400*x(2)+2, -400*x(1); -400*x(1), 200];
    fmin = 0; x0 = [-1.2;1];
  case 2
    f = @(x) log(1+(x(1)-x(2))^2);
    Df = @(x) [1/(1+(x(1)-x(2))^2)*2*(x(1)-x(2)); ...
               1/(1+(x(1)-x(2))^2)*2*(x(2)-x(1))];
    fmin = 0; x0 = [2;4];
  case 3
    e = 1e-2;
    f = @(x) e*x(1)^2 + x(2)^2;
    Df = @(x) [2*e*x(1); 2*x(2)];
    fmin = 0; x0 = [1;1+e];
end
tol = 1e-14; maxit = 1e4;

[~,~,iter,nfeval,nDfeval,fvec] = SteepestDescent(f,Df,x0,tol,maxit,'wolfe',fmin);
semilogy(0:iter,abs(fvec-fmin),'<-');  hold on;

t = 1e-8; p1 = [1;0]; p2 = [0;1]; 
rFDf = @(x) [f(x+t*p1)-f(x); f(x+t*p2)-f(x)]/t; 
cFDf = @(x) [imag(f(x+1i*t*p1));imag(f(x+1i*t*p2))]/t;
[~,~,iter,nfeval,nDfeval,fvec] = SteepestDescent(f,rFDf,x0,tol,maxit,'wolfe',fmin);
semilogy(0:iter,abs(fvec-fmin),'.-');
[~,~,iter,nfeval,nDfeval,fvec] = SteepestDescent(f,cFDf,x0,tol,maxit,'wolfe',fmin);
semilogy(0:iter,abs(fvec-fmin),'->');  hold off;
xlabel('iteration number k'); ylabel('$|f(x_k)-f(x_*)|$','interpreter','latex')
set(gca,'FontSize',20); 
h = legend('SD with exact $\nabla f$','SD with real step FD', ...
           'SD with complex step FD');
set(h,'interpreter','latex','FontSize',20);