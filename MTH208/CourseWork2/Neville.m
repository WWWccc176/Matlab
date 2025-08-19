%% Section 2.2.1 & 2.2.2 Neville 方法及误差分析
clear; clc; close all;

% --- 原函数 & 节点 ---
f = @(x) exp(-x.^2/20).*cos(5*x);
k = -15:15;
x_nodes = k*pi/5;
y_nodes = f(x_nodes);

% --- 连续评估点 & 节点处插值 ---
x_eval    = linspace(min(x_nodes),max(x_nodes),1000);
P_eval    = nevilleInterp(x_nodes, y_nodes, x_eval);
P_atNodes = nevilleInterp(x_nodes, y_nodes, x_nodes);

% --- 绘图 ---
figure('Name','2.2.1 Neville Iterpolation and Absolute Error','NumberTitle','off');
subplot(2,1,1);
plot(x_eval, f(x_eval),'b-','LineWidth',1.5); hold on
plot(x_nodes, y_nodes,'ro','MarkerFaceColor','r');
plot(x_eval, P_eval,'r--','LineWidth',1.5);
legend('f(x)','node','Neville P_n(x)','Location','Best');
title('Comparision with Neville');
xlabel('x'); ylabel('y');

subplot(2,1,2);
stem(x_nodes, abs(y_nodes - P_atNodes),'k','filled');
title('Error at nodes |f(x_k)-P_n(x_k)|');
xlabel('x_k'); ylabel('Error');
grid on;
