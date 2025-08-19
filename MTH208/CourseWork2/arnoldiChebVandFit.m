function [d,H,x] = arnoldiChebVandFit(f,n)
% ARNOL DICHEBVANDFIT 在 [–10,10] 上用 n 次多项式对 f 作 Arnoldi-Vandermonde 拟合
% 输入：
%   f  – 函数句柄，例如 @(x) exp(-x.^2/20).*cos(5*x)
%   n  – 拟合多项式最高次
% 输出：
%   d  – (n+1)x1 拟合系数向量（Arnoldi 基下）
%   H  – (n+1)x n 上 Hessenberg 矩阵，用于后续评估
%   x  – (n+1)x1 Chebyshev–Lobatto 节点

  % 1. 生成 Chebyshev–Lobatto 节点（包括端点）
  a = -10; b = 10;
  k = (0:n)';
  x = (a+b)/2 + (b-a)/2 * cos(pi*k/n);

  % 2. 计算 f 在节点处的取值
  fx = f(x);

  % 3. Arnoldi 正交化生成 Q 和 H
  m = n+1;
  Q = ones(m,1);          % 第一列 q_0
  H = zeros(n+1,n);
  for kk = 1:n
    q = x .* Q(:,kk);
    for jj = 1:kk
      H(jj,kk) = (Q(:,jj)' * q) / m;
      q = q - H(jj,kk)*Q(:,jj);
    end
    H(kk+1,kk) = norm(q)/sqrt(m);
    Q = [Q, q/H(kk+1,kk)];
  end

  % 4. 计算拟合系数 d
  d = (Q' * fx) / m;
end
