function [y] = ttl6q2(x)
if x<-1
    y = exp(x+1);
elseif x>=-1&&x<5
    y = 2 + cos(pi*x);
else 
    y = 10*(x-5) + 1;
end