function [p,flag] = secant(fun,p0,p1,tol,maxIt)

n = 1; flag = 0; % Initializaiton
q0 = fun(p0);  q1 = fun(p1);

disp('-----------------------------------')
disp('Secant Method')
disp('-----------------------------------')
disp(' n    p_n             f(p_n)')
disp('-----------------------------------')
formatSpec = '%2d    %.17f    % .30f \n';
fprintf(formatSpec,[n-1,p0,fun(p0)])
fprintf(formatSpec,[n,p1,fun(p1)])

while n<=maxIt
   p = p1 - q1*(p1-p0)/(q1-q0);
   %p = (q1*p0-q0*p1)/(q1-q0);
   n = n+1;
   fprintf(formatSpec,[n,p,fun(p)])
   if abs(p-p0) < tol
        flag = 1; break; 
   else
       p0 = p1; q0 = q1; p1 = p; q1 = fun(p);
   end
end


    