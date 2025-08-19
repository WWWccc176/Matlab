load('FB_stock_data.mat'); % Assuming the data is saved in this file
Ave = mean(Open);
Sigma = std(Open);
floorAve = floor(Ave);
ceilSigma = ceil(Sigma);
disp(['floor(Ave) = ', num2str(floorAve)]);
disp(['ceil(Sigma) = ', num2str(ceilSigma)]);
daysBetween200And240 = sum(Open > 200 & Open < 240);
disp(['Number of days open price was between $200 and $240: ', num2str(daysBetween200And240)]);
daysBelow180OrAbove260 = sum(Close < 180 | Close > 260);
disp(['Number of days close price was below $180 or above $260: ', num2str(daysBelow180OrAbove260)]);
shares = 2000;
for i = 1:length(Open)
    if Open(i) < 260
        shares = shares + 200;
    elseif Open(i) > 290
        shares = 0; % Sell all shares
    end
end
disp(['Number of shares at the end of the period: ', num2str(shares)]);
shares = 2000;
for i = 1:length(Open)
    if Open(i) < 260
        shares = shares + 200;
    elseif Open(i) > 290 && shares >= 400
        shares = shares - 400;
    end
end
disp(['Number of shares at the end of the period: ', num2str(shares)]);
