clear; clc;
function factors=pfactor(n)
factors=[];
for k=2:n
    while rem(n,k)==0
        factors=[factors k];
        n=n/k;
    end
end