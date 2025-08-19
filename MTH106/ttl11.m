clear;
n = 45;
sam_size = 500;
data = randn(sam_size, n);
sam_mean = mean(data, 1); 
figure;
histfit(sam_mean);