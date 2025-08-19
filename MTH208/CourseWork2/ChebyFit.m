% runChebArnoldiFit.m
% 演示在 [–10,10] 上用 Arnoldi-Vandermonde 方法对一个标量函数拟合并作误差分析

clear; clc; close all;

% 1. 定义原函数和多项式阶数
f = @(x) exp(-x.^2/20) .* cos(5*x);  
n = 300;       % 你可改成任意阶数

% 2. 调用拟合函数，得到拟合系数 d、H 和节点 xnode
[d, H, xnode] = arnoldiChebVandFit(f, n);

% 3. 在 s = -10:0.1:10 上评估原函数和拟合多项式
s = (-10:0.1:10)';
% 3.1 原函数
f_true = f(s);

% 3.2 用 Arnoldi-Hessenberg 评估拟合值
M = numel(s);
W = ones(M,1);          % W(:,1) = 1
for kk = 1:n
  w = s .* W(:,kk);
  for jj = 1:kk
    w = w - H(jj,kk)*W(:,jj);
  end
  W = [W, w / H(kk+1,kk)];
end
f_fit = W * d;

% 4. 作图
figure('Units','normalized','Position',[.2 .2 .6 .6]);

% 上：原函数 vs 拟合
subplot(2,1,1);
plot(s, f_true, 'b-', 'LineWidth',1.2); hold on
plot(s, f_fit, 'r--', 'LineWidth',1.2);
legend('f(x)','Arno–Vand','Location','Best');
xlabel('x'); ylabel('y');
title(sprintf('Arnoldi–Vandermonde (n = %d)', n));
grid on;

% 下：误差曲线
subplot(2,1,2);
err = f_true - f_fit;
plot(s, err, 'k-', 'LineWidth',1);
xlabel('x'); ylabel('Error f(x)-p_n(x)');
title('Error (StepLength 0.1)');
grid on;
fprintf('\nArnoldi–Vandermonde coefficients (d_0 … d_n):\n');
for k = 0:n
    fprintf('  d(%2d) = %.15e\n', k, d(k+1));
end