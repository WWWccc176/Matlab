%Q1
a = linspace(0,1,30);
e = exp(1);
plot(a,sqrt(2*pi)*e.^(-a.^2/2),'r*:')
hold on
%Q2
b = linspace(0,10,30);
e = exp(1);
figure%另起一页画图, 
plot(b,2*e.^(-2.*b))
hold on%保持这一张图，在生成下一张图时不会把这一张图替代
%Q3
load techCorp.mat
figure, plot(TSLA)
title('share of TSLA');%加标题
xlabel('shareprice');%加坐标轴名称
ylabel('time');
hold on
%Q4
plot(1:length(AAPL),AAPL,...%三个点可以用shift + enter输入，用于一段代码太长换行用，相当于不做任何操作
1:length(TSLA),TSLA,...
1:length(GOOG),GOOG,...
1:length(FB),FB);
legend("AAPL","TSLA","GOOG","FB")%在图中加标签
hold off %结束'hold on'