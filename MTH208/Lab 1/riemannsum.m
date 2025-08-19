%riemannsum for lab1_ex5
function R = riemannsum(f,a,b,n)

dx = (b-a)/n;
R = 0;
for k=1:n
    x = a + (k-1)*dx;
    R = R + f(x)*dx;
end

end % end function riemannsum