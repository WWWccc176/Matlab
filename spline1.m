clear;
clc;
% --- 示例 1: 基本三次样条 ---
x_data = [0 1 2 3];          % 数据点的 x 坐标
y_data = [0 1 -1 0];          % 数据点的 y 坐标

x_eval = linspace(min(x_data), max(x_data), 100); % 生成用于绘图的密集 x 点

% 使用 spline 函数计算并评估三次样条插值
y_spline = spline(x_data, y_data, x_eval);

% 绘图
figure;
plot(x_data, y_data, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % 原始数据点
hold on;
plot(x_eval, y_spline, 'b-', 'LineWidth', 2); % 三次样条曲线
title('示例 1：基本三次样条插值');
xlabel('x');
ylabel('y');
legend('数据点', '三次样条曲线');
grid on;
hold off;
