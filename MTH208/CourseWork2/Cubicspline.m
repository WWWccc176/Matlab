%% Section 2.2.3 & 2.2.4 三次样条插值及误差分析
clear; clc; close all;

% --- 原函数 & 节点 ---
f = @(x) exp(-x.^2/20).*cos(5*x);
k = -15:15;
x_nodes = k*pi/5;
y_nodes = f(x_nodes);

% --- 连续评估点 & 节点处插值 ---
x_eval    = linspace(min(x_nodes),max(x_nodes),1000);
S_eval    = splineInterp(x_nodes, y_nodes, x_eval);
S_atNodes = splineInterp(x_nodes, y_nodes, x_nodes);

% --- 绘图 ---
figure('Name','2.2.3 Cubic Spline & Absolute Error','NumberTitle','off');
subplot(2,1,1);
plot(x_eval, f(x_eval),'b-','LineWidth',1.5); hold on
plot(x_nodes, y_nodes,'ks','MarkerFaceColor','k');
plot(x_eval, S_eval,'m-.','LineWidth',1.5);
legend('f(x)','nodes','Spline(x)','Location','Best');
title('Comparision with Cubic Spline');
xlabel('x'); ylabel('y');

% --- 下半图：连续误差 (步长 0.01) ---
subplot(2,1,2);
s       = -10:0.01:10;                % 以 0.01 为步长的密网格
f_true  = f(s);                      % 真值
S_fit   = splineInterp(x_nodes, y_nodes, s);  % 在相同 s 上的插值
err     = f_true - S_fit;            % 误差

plot(s, err, 'k-', 'LineWidth',1);
xlabel('x'); 
ylabel('Error f(x)-S(x)');
title('Error (StepLength 0.01)');
grid on
