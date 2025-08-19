clear;
data = xlsread('CPI.xlsx');
CPI = data(:, 1);
GDP = data(:, 2);
scatter (CPI, GDP,'filled')