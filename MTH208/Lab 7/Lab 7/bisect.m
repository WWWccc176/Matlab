function [p,flag] = bisect(fun,a,b,tol,maxIt)
%% This is a more robust version of Bisection Method than bisect1.m

flag = 0; % Use a flag to tell if the output is reliable
if abs(fun(a))<1e-14
    p = a;
    return;
end
if abs(fun(b))<1e-14
    p = b;
    return;
end
if fun(a)*fun(b) > 0 % Check f(a) and f(b) have different sign
    error('f(a) and f(b) must have different signs');
end

for n = 1:maxIt
    p = (a+b)/2;
    FA = fun(a);
    FP = fun(p);    
    if abs(FP) <= 10^(-15) || (b-a)/2 < tol 
        flag = 1; 
        break; % Break out the for loop.
    else
        if FA*FP > 0
            a = p;
        else
            b = p;
        end
    end    
end