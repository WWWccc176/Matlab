% adaptive quadrature

f = @(x) sqrt(x); 
%f = @(x) 1+sin(exp(3*x));
[q,e,x] = adapsimpson(f,0,1,1e-10); 
format long;
disp('quadrature value: ');
disp(q);
disp('estimated error: ');
disp(e);
disp('actual error: ');
disp(abs(2/3-q));
disp('number of quadrature points: ');
disp(length(x));
