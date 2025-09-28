clear; 
clc;
format long

confidence=0.99;

y = readtable('Lab1.xlsx','Sheet','loss data','DataRange','A2:B1279');
loss_date = y{:,1};   % : to select all rows, 1 to select 1st column
loss = y{:,2};        % : to select all rows, 2 to select 2nd column
T = size(loss, 1);    % 1: row dimension, 2: column dimension

ave_loss = mean(loss);
std_loss = std(loss);
inv=norminv(confidence);
VaR = ave_loss + std_loss * inv;

disp(VaR)

initial_Window=200;
N_e=0;

for i = 1+initial_Window:T
    loss_temp = loss(1:i-1);
    mu_temp = mean(loss_temp);
    sd_temp = std(loss_temp);
    VaR_temp = mu_temp+norminv(confidence)*sd_temp;
    loss_next_day = loss(i);
    if loss_next_day > VaR_temp   % exception
         N_e = N_e + 1;
    end
    disp(VaR_temp)
end
disp(N_e)

N_total = T - initial_Window;   % total sample size for back-testing
p = 1 - confidence; 

if N_e > N_total*p
    p_value = 1-binocdf(N_e-1, N_total, p);
elseif N_e < N_total*p
    p_value = binocdf(N_exceptions, N_total, p);
end
disp(p_value)