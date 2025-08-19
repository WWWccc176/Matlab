clear
A = xlsread('stockprice.xlsx');
X = A(:,1);
Y = A(:,2);
var_sp=var(X)
var_sc=var(Y)
VCV =cov(X,Y)
Corrcoe = corrcoef(X, Y)