clear; clc; close all;

% --- 原函数 ---
f = @(x) exp(-x.^2/20) .* cos(5*x);

% --- 1) 等距节点 k*pi/5, k=-15:15 ---
k = -15:15;
nodes1 = k*pi/5;

% --- 2) cos(5x)=0 的零点 x = (2*m+1)*pi/10 ---
m = -20:20;                % 取足够多的 m
nodes2 = (2*m+1)*pi/10;    % 所有零点
nodes2 = nodes2(nodes2>=-10 & nodes2<=10);

% --- 3) 加上端点 -10, 10 并去重排序 ---
x_nodes = unique([-10, nodes1, nodes2, 10]);
y_nodes = f(x_nodes);

% --- 连续评估点 & 插值评估 ---
x_eval    = linspace(-10, 10, 1000);
S_eval    = splineInterp(x_nodes, y_nodes, x_eval);
S_atNodes = splineInterp(x_nodes, y_nodes, x_nodes);

% --- 绘图 ---
figure('Name','2.2.3 Cubic Spline & Absolute Error','NumberTitle','off');

subplot(2,1,1);
plot(x_eval,      f(x_eval),   'b-',  'LineWidth',1.5); hold on
plot(x_nodes,     y_nodes,     'ks',  'MarkerFaceColor','k');
plot(x_eval,      S_eval,      'm-.', 'LineWidth',1.5);
legend('f(x)','nodes','Spline(x)','Location','Best');
title('Comparison with Cubic Spline');
xlabel('x'); ylabel('y');
grid on

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
