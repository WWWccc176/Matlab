clear;
Satisfaction = [69 78 97 81 42 45 27 89 74 59 54 90 87 99 86 72 84 40 50 52 61 30 55 80 78 30 76 75 60 53]'; 
Severity =     [49 23 45 49 59 61 63 39 45 53 37 31 33 32 34 50 62 72 60 39 42 65 32 43 39 64 38 46 52 38]';
scatter(Satisfaction, Severity,'*',"blue")
hold on
mean1 = mean(Severity);
mean2 = mean(Satisfaction);

Sxx = sum((Satisfaction - mean1).^2);
Syy = sum((Severity - mean2).^2);
Sxy = sum((Satisfaction - mean1).*(Severity - mean2));

beta1hat = Sxy / Sxx;
beta0hat = mean1 - beta1hat*mean2;
yhat=beta0hat+beta1hat.*Satisfaction;
plot(Satisfaction, yhat, 'r-', 'LineWidth', 1);
legend('Data', 'Regression Line');
hold off

residuals = Severity - yhat;
mr=mean(residuals)
vr=var(residuals)

b = 1:length(residuals);
scatter(b,residuals , 'filled','red');

qqplot(residuals);

scatter(yhat, residuals, 'filled');
scatter(residuals, Satisfaction,'red','*');

histogram(residuals, 'Normalization', 'pdf', 'BinWidth', 7);

