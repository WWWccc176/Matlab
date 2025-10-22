
% MTH305 Risk Management
% W4 Correlations and Copulas
% This is to replicate Table 11.5 for calculating joint CDF of V1 and V2 in the Gaussian copula.
% The results could be slightly different from textbook that is via an Excel user-defined function.
% Please use the MATLAB function mvncdf for multivariate normal calculations in this module. 

clear
clc

% 1. random variables V1 and V2 have triangular PDFs
v1_value = 0.1:0.1:0.9;
v2_value = v1_value;
v1_cdf = [5 20 38.75 55 68.75 80 88.75 95 98.75]/100;
v2_cdf = [2 8 18 32 50 68 82 92 98]/100;
n1 = size(v1_cdf, 2);
n2 = size(v2_cdf, 2);

% 2. transform V1 and V2 to U1 and U2, respectively
u1_value = norminv(v1_cdf);
u2_value = norminv(v2_cdf);

% 3. calculate the joint CDF
mu = [0 0];
rho = 0.5;
Sigma = [1 rho; rho 1];

Y = NaN(n1, n2);
for i = 1:n1
    for j = 1:n2
        Y(i, j) = mvncdf([u1_value(i), u2_value(j)], mu, Sigma);
    end
end


% % solution to tutorial Q3
% % adjust the following lines
% v1_value = [0.25, 0.5, 0.75];
% v1_cdf = v1_value;   % uniform distribution
% v2_cdf = v2_value;
% rho = 0.3;