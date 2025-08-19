function [p,flag] = newton(fun,Dfun,p0,tol,maxIt)

n = 0; flag = 0; % Initializaiton

disp('-----------------------------------')
disp('Newton Method')
disp('-----------------------------------')
disp(' n    p_n             f(p_n)')
disp('-----------------------------------')
formatSpec = '%2d    %.17f    % .30f \n';
fprintf(formatSpec,[n,p0,fun(p0)])

while n<=maxIt
   p = p0 - fun(p0)/Dfun(p0); 
   n = n+1; 
   fprintf(formatSpec,[n,p,fun(p)])
   if abs(p-p0) < tol
        flag = 1; break; 
   end
   p0 = p;
end


    