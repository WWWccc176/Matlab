clear; clc; close all;

% --- 原函数 ---
f = @(x) exp(-x.^2/20) .* cos(5*x);

% --- 1) 等距节点 k*pi/5, k=-15:15 ---
k      = -15:15;
nodes1 = k*pi/5;

% --- 2) cos(5x)=0 的零点 x = (2*m+1)*pi/10 在 [-10,10] 内 ---
m      = -20:20;
nodes2 = (2*m+1)*pi/10;
nodes2 = nodes2(nodes2>=-10 & nodes2<=10);

% --- 3) 加上端点 -10,10 并去重排序 得到原始节点 ---
nodes = unique([-10, nodes1, nodes2, 10]);

% --- 4) 在每对相邻节点之间插入 2 个等距“额外节点” ---
extra = []; 
for i = 1:length(nodes)-1
    h = nodes(i+1) - nodes(i);
    extra = [ extra, ...
              nodes(i) + (1/5)*h, ...
              nodes(i) + (2/5)*h, ...
              nodes(i) + (3/5)*h, ...
              nodes(i) + (4/5)*h, ...
              ];
end

% --- 最终所有节点 & 函数值 ---
x_nodes = sort([nodes, extra]);
y_nodes = f(x_nodes);

% --- 连续评估点 & 样条插值评估 ---
x_eval    = linspace(-10, 10, 1000);
S_eval    = splineInterp(x_nodes, y_nodes, x_eval);

% --- 绘图 ---
figure('Name','Cubic Spline with Extra Nodes','NumberTitle','off');

% 上半图：原函数 vs 样条插值 & 节点位置
subplot(2,1,1);
plot(x_eval,      f(x_eval), 'b-',  'LineWidth',1.5); hold on
plot(x_nodes,     y_nodes,   'k*',  'MarkerSize',4);
plot(x_eval,      S_eval,    'm-.', 'LineWidth',1.5);
legend('f(x)','nodes','Spline(x)','Location','Best');
title('Cubic Spline Interpolation with Extra Nodes');
xlabel('x'); ylabel('y');
grid on;

% 下半图：连续误差 (步长 0.01)
subplot(2,1,2);
s      = -10:0.01:10;                   
err    = f(s) - splineInterp(x_nodes, y_nodes, s);
plot(s, err, 'k-', 'LineWidth',1.2);
title('Error f(x)-S(x) (step = 0.01)');
xlabel('x'); ylabel('Error');
grid on;
