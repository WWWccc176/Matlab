function [p,flag] = fixedpoint(fun,p0,tol,maxIt)

n = 1; flag = 0; % Initialization

disp('Fixed Point Iteration')
disp('----------------------------------------------')
disp(' n     p                     f(p_n)')
disp('----------------------------------------------')
formatSpec = '%2d    % .15f    % .15f \n';
fprintf(formatSpec,[n-1,p0,fun(p0)]) % printing output

while n <= maxIt
    p = fun(p0);
    fprintf(formatSpec,[n,p,fun(p)]) % printing output
    if abs(p-p0) < tol
        flag = 1; 
        break;
    else
        n = n+1;
        p0 = p;
    end
end

