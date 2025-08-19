function [de] = mypolyder(a)
L = length(a);
b = L-1:-1:1;
c = a(1,L-1);
de = b.*c;
end