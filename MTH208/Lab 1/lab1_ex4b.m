%lab1_ex4b
function s = lab1_ex4b(n)

s = 0;
p = 1;
for k=1:n
    m=2*k-1;
    p=p*m;
    s = s + p;
end

end % end function lab1_ex4b