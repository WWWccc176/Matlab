clear
Month = [1 2 3 4 5 6 7 8];
Debt  = [620 761.8 900 1040 1270.6 1589 1851.3 2155];
ln_Debt = log(Debt);
p = polyfit(Month, ln_Debt, 1);
a = exp(p(2))
b = exp(p(1))
residual = ln_Debt-(p(1)*Month-p(2));
R2 = 1-sum(residual.^2)/sum((ln_Debt-mean(Debt)).^2)
x = 1:.1:8;
y = a*b.^x;
plot(x, y)
xlabel('Month')
ylabel('Debt')
title('recent graduate’s credit')
Month_12 = 12; 
% Then use model to predict debt at Month 12
Debt_12 = a * b ^ Month_12