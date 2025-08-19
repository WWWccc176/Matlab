clear
load ('AAPL_LogReturn.mat','R')

rt = R(2:end)/100; 
rt_minus1 = R(1:end-1)/100; 

Return12 = [rt, rt_minus1]; 
B_poly = polyfit(rt_minus1, rt, 1);
b1 = B_poly(1); 
a = B_poly(2); 

X = [ones(length(rt_minus1),1), rt_minus1]; % Include a column of ones for the intercept
B_reg = regress(rt,X); 
a_regress = B_reg(1)
b1_regress = B_reg(2)