f = @(x) 1./(1+25*x.^2); % 龙格函数
xx = -1:0.01:1;        % 待求值点
plot(xx, f(xx), 'LineWidth', 2); % 绘制原始函数
hold on;

for n = 10:5:30       % 循环不同的插值多项式次数 n = 10, 15, 20, 25, 30
    x = cos((0:n)*pi/n); % 生成切比雪夫节点
    y = f(x);
    yy = lagrange(x,y,xx); % 计算拉格朗日插值多项式
    plot(xx, yy, '--');  % 绘制插值多项式图像
end

hold off;
legend('原始函数 f(x)', 'n=10', 'n=15', 'n=20', 'n=25', 'n=30');
title('切比雪夫节点拉格朗日插值');
