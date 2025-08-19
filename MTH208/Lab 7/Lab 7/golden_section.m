function p = golden_section(f,a,b,tol,maxIt)

t = (-1+sqrt(5))/2;
p = t*a + (1-t)*b; q = (1-t)*a + t*b;
fp = f(p); fq = f(q);
for n = 1:maxIt
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