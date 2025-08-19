%Q1
Price_A = [234 239 229 220 222 224 218 225 238 246 249 257 251 243 235];
Price_B = [221 218 210 209 207 205 204 202 205 209 212 210 213 217 224];
diff = Price_A - Price_B;
a = find(diff>20)
diff(a)
amountA = 1000;
amountB = 0;
nincrease = 0;
for i = 1:length(diff)
    if diff(i)>20
        amountA = amountA - 100;
        amountB = amountB + 100;
        nincrease =nincrease + 100*(Price_A(i)-Price_B(i));
    end
end
disp(amountA)
disp(amountB)
disp(nincrease)
%not use loop:amountA = 1000-100*length(a);amountB = 100*length(a)

%Q2(2)
y = @PresentValue;
Cash = 1000;
ZeroRates = .04;
Years = 6;
price = y(Cash, ZeroRates, Years)
%Q2(3)
FaceValue = 1000; 
Coupon = 50;
T = 5;
ZeroRates = [0.035, 0.034, 0.036, 0.036, 0.038];
CashFlows = ones(1, T) * Coupon;
CashFlows(end) = CashFlows(end) + FaceValue
PVs = PresentValue(CashFlows, ZeroRates, 1: T)
BondPrice = sum(PVs)
fprintf('The price of the bond is %.2f RMB\n', BondPrice)





