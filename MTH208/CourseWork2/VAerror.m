% runErrorVsDegree.m
% 1) 多项式次数 n 从 30 到 1000，步长让你自己定
n_list = 30:2:1000;      
N = numel(n_list);

% 2) 误差保存向量
max_err = zeros(N,1);

% 3) 统一的评估点
s = (-10:0.05:10)';        % 细网格
f = @(x) exp(-x.^2/20).*cos(5*x);
f_true = f(s);

% 4) 循环计算，每个 n 求出最大绝对误差
for idx = 1:N
    n = n_list(idx);
    % 调用 Arnoldi-Vandermonde 拟合
    [d, H, xnode] = arnoldiChebVandFit(f, n);
    
    % 在 s 上用 Arnoldi–Hessenberg 评估拟合值
    M = numel(s);
    W = ones(M,1);         % W(:,1)
    for k = 1:n
        w = s .* W(:,k);
        for j = 1:k
            w = w - H(j,k)*W(:,j);
        end
        W(:,k+1) = w / H(k+1,k);
    end
    f_fit = W * d;
    
    % 取最大误差
    err = abs(f_true - f_fit);
    max_err(idx) = max(err);
    
    fprintf('n = %4d, max error = %8.2e\n', n, max_err(idx));
end

% 5) 对数–对数绘图
figure;
loglog(n_list, max_err, '*-', 'LineWidth',1.2, 'MarkerSize',6);
grid on;
xlabel('Polynomial degree n');
ylabel('Max absolute error \max |f(s)-p_n(s)|');
title('Error of Degree for Arno–Vand');
