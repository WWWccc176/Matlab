tSpan = [0 4*pi];

% 定义初始条件：y(0) = 0, y'(0) = 1
initCond = [0; 1];

% 定义一阶微分方程组
odeFun = @(t, y) [y(2); -2*y(2) - y(1) + 2*sin(t)];

% 使用 ode45 求解
[tSol, ySol] = ode45(odeFun, tSpan, initCond);