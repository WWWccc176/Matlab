plot([1 2 2], [4 5 8])%分段线段
hold on
x = linspace(-10,10,3000);
plot(x, sin(x))
hold on
y = linspace(-1,1,100);
plot(y,sqrt(1-y.^2))
hold on
n = 1:100; 
plot((1+1./n).^n)
hold on
a = linspace(-100,100,999);
e = exp(1);
plot(a,sqrt(2*pi)*e.^(-a.^2/2),'ro:')
hold off
load techCorp.mat
% plot(AAPL)
% figure, plot(GOOG)
% figure, plot(TSLA)
% figure, plot(FB)
plot(1:length(AAPL),AAPL,...
1:length(TSLA),TSLA,...
1:length(GOOG),GOOG,...
1:length(FB),FB);
