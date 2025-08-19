function [extra_day] = ttl6q4(x)
if mod(x,400)==0
    extra_day = 1;
elseif mod(x,100)==0
    extra_day = 0;
elseif mod(x,4)==0
    extra_day = 1;
end    