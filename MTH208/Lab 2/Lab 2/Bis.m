fun= @(x) pi+sin(x/2)/2;
[p,flag] = fixedpoint(fun,5,0001,1000)