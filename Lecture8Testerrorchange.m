% 参数设置
epsilon = eps; % 使用机器精度作为 ε
M = 100; % M 的值，可以根据实际情况调整
h = logspace(-11, -3, 1000000); % h 的取值范围，从 1e-15 到 1e-3，共 1000 个点（对数分布）

% 计算误差 e(h)
e_h = epsilon ./ h + (h.^2) / 6 * M;

% 绘图
figure;
semilogx(h, e_h, 'LineWidth', 2); % 使用对数坐标轴
xlabel('h');
ylabel('e(h)');
title('Error e(h) vs h (h from very small to moderate)');
grid on;