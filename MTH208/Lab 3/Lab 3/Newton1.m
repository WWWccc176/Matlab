clc
clear
fun=@(x) sin(x^2)-0.5;
Dfun=@(x)2*cos(x^2);
p0=0.3;
tol=10^(-20);
maxIt=70;
[a,b]=newton(fun,Dfun,p0,tol,maxIt)