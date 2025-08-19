load techCorp.mat;
sum(TSLA > 100)
a = TSLA(TSLA > 100)
b = rand(length(GOOG), 1);
B = logical(b > .5);
b1 = double(B);
GOOG1 = b1.*GOOG;
n = sum(b1);
randaverGOOG = sum(GOOG1)/n