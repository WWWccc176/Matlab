clear
x=[1:9];
y = [5,6,10,20,28,33, 34, 36,42] ;
residual2 = zeros(4,1); % square of residual
for k = 1:4
    p = polyfit(x,y,k) ;
    residual2(k)=sum((polyval(p,x)-y).^2);
end
residual2