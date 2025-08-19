%lab1_ex3
clear;clc;
% We invoke the function lab1_ex3_psum to compute the partial sums
s0 = lab1_ex3_psum(10)
s1 = lab1_ex3_psumtest(10)
s2 = lab1_ex3_psum(100)
s3 = lab1_ex3_psumtest(100)
s4 = lab1_ex3_psum(1000)
s5 = lab1_ex3_psumtest(1000)
s6 = kahan_sum(1000)