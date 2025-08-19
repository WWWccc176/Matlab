function s = lab1_ex3_psum(n)

s = 0;
for k = n:-1:1 % go backward, to avoid swamping 
    s = s + 1/k^2;
end

end % end function lab1_ex3_psum