clear;clc;
% lab1_ex6
f = inline('exp(-x)*x');

% We invoke the function riemannsum to compute the integral
R0 = riemannsum(f,0,2,10)
R1 = riemannsum(f,0,2,100)
R2 = riemannsum(f,0,2,1000)
1 - exp(-2)*(2) % the exact value