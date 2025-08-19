price = [19,18,22,21,25,19,17,21,27,29];
amount = 1000;
tspend = 0;
treceice = 0;
nincrease = 0;
for i = 1:length(price)
    if price(i)<20
        amount = amount + 100;
        tspend = tspend + 100*price(i);
    elseif  price(i)>25 & amount >= 100
          amount = amount-100;
          treceice = treceice + 100*price(i);
    end
end
nincrease = 29*amount - 19*1000;
disp(amount)
disp(tspend)
disp(treceice)
disp(nincrease)