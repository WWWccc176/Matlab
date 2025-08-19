function s = lab1_ex3_psumtest(n)

s = 0;
for k = 1:1:n % go backward, to avoid swamping 
    s = s + 1/k^2;
end

end % end function lab1_ex3_psum