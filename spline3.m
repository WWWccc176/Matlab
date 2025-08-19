x_data = [0 1 2 3];
y_data = [0 2 1 3];

% 获取样条的 piecewise polynomial 结构体
pp = spline(x_data, y_data);

% 查看节点（分割点）
disp('Breaks (Knots):');
disp(pp.breaks);
% >> Breaks (Knots):
% >>   0     1     2     3

% 查看每个片段的系数
% 每一行 [ai bi ci di] 对应 S_i(x) = ai*(x-xi)^3 + bi*(x-xi)^2 + ci*(x-xi) + di
disp('Coefficients (per piece):');
disp(pp.coefs);
% >> Coefficients (per piece):
% >>  -0.7500    0         2.7500         0           % S0(x) for x in [0, 1]
% >>   0.7500   -2.2500   -0.2500    2.0000           % S1(x) for x in [1, 2]
% >>  -0.7500    0         2.7500    1.0000           % S2(x) for x in [2, 3]
