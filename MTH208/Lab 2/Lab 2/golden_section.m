function p = golden_section(f,a,b,tol,maxIt)

t = (-1+sqrt(5))/2;
p = t*a + (1-t)*b; q = (1-t)*a + t*b;
fp = f(p); fq = f(q);
disp('Bisection Methods')
disp('-----------------------------------------------------------------')
disp(' n     a_n             b_n             p_n             f(p_n)')
disp('-----------------------------------------------------------------')
formatSpec = '%2d    % .9f    % .9f    % .9f    % .9f \n';
for n = 1:maxIt
    fprintf(formatSpec,[n,a,b,p,f(p)])
    if abs(b-a)<tol
       break;
    else
        if fp<fq
            b = q; q = p; p = t*a + (1-t)*b; fq = fp; fp = f(p);
        else
            a = p; p = q; q = (1-t)*a + t*b; fp = fq; fq = f(q);
        end
    end
end