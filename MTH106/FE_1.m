clear
AAPL = readtable('AAPL.csv', 'VariableNamingRule', 'preserve');
GOOG = readtable('GOOG.csv', 'VariableNamingRule', 'preserve');
TSLA = readtable('TSLA.csv', 'VariableNamingRule', 'preserve');
days1 = sum(TSLA.Open > 4 * AAPL.Open)

days2 = sum((TSLA.Open > 4 * AAPL.Open) & (TSLA.Open > 0.4 * GOOG.Open))

days3 = sum((TSLA.Open > 4 * AAPL.Open) | (TSLA.Open > 0.4 * GOOG.Open))

days4 = sum(xor(TSLA.Open > 4 * AAPL.Open, TSLA.Open > 0.4 * GOOG.Open))

sharesOwned = 600;

for i = 1:height(TSLA)
    if TSLA.Open(i) < 200
        sharesOwned = sharesOwned + 100;
    elseif TSLA.Open(i) > 600 && sharesOwned >= 200
        sharesOwned = sharesOwned - 200;
    end
end

% Final shares owned
sharesOwned

