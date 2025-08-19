clear;
data = xlsread('CPI.xlsx');
CPI = data(:, 1);
GDP = data (:, 2);
std_CPI = (CPI - mean(CPI))/std(CPI) ;
std_GDP = (GDP - mean (GDP))/std(CPI);
qqplot (std_CPI);
figure;
plot(std_GDP);