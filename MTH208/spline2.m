% --- 示例 2: 三次样条 vs. 线性插值 ---
x_data = [0 1 2 3];
y_data = [0 1 -1 0];
x_eval = linspace(min(x_data), max(x_data), 100);

% 计算三次样条插值
y_spline = spline(x_data, y_data, x_eval);

% 计算线性插值 (使用 interp1)
y_linear = interp1(x_data, y_data, x_eval, 'linear');

% 绘图
figure;
plot(x_data, y_data, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % 数据点
hold on;
plot(x_eval, y_spline, 'b-', 'LineWidth', 2);    % 三次样条
plot(x_eval, y_linear, 'g--', 'LineWidth', 1.5); % 线性插值
title('示例 2：三次样条 vs. 线性插值');
xlabel('x');
ylabel('y');
legend('数据点', '三次样条', '线性插值');
grid on;
hold off;

