% 清除工作区变量，关闭所有图形窗口
clear; clc

% ========== 步骤1：定义复平面网格 ==========
% 设置实部 (Re) 和虚部 (Im) 的范围及分辨率
Re = linspace(-3, 3, 100);    % 实部范围：-3 到 3，100个点
Im = linspace(-5, 5, 100);    % 虚部范围：-5 到 5，100个点
[ReGrid, ImGrid] = meshgrid(Re, Im);  % 生成网格

% 构建复数矩阵 s = Re + i*Im
s = ReGrid + 1i * ImGrid;

% ========== 步骤2：计算Gamma函数值 ==========
% 预分配内存
Z = zeros(size(s));           % 存储Gamma函数值

% 遍历每个复数点（避免符号计算的性能问题）
for i = 1:size(s,1)
    for j = 1:size(s,2)
        try
            % 使用符号数学工具箱计算复数Gamma函数（已修改函数名）
            Z(i,j) = my_gamma(vpa(s(i,j))); % 使用重命名后的函数
        catch
            % 遇到极点或计算错误时赋值为NaN
            Z(i,j) = NaN;
        end
    end
end

% 提取模和相位（弧度）
ModZ = abs(Z);                % 模（高度）
PhaseZ = angle(Z);            % 相位（-π 到 π）

% ========== 步骤3：绘制三维曲面 ==========
figure('Color', 'white');

% --- 子图1：模 + 相位颜色 ---
subplot(1,2,1);
surf(ReGrid, ImGrid, ModZ, PhaseZ, 'EdgeColor', 'none');
title('|Γ(s)| with Phase Coloring');
xlabel('Re(s)'); ylabel('Im(s)'); zlabel('|Γ(s)|');
colormap hsv;                % 使用HSV颜色映射表示相位
colorbar;
shading interp;              % 平滑颜色
view(-30, 30);              % 设置视角
axis tight;

% --- 子图2：实部 + 虚部颜色 ---
subplot(1,2,2);
surf(ReGrid, ImGrid, real(Z), imag(Z), 'EdgeColor', 'none');
title('Re(Γ(s)) with Imaginary Coloring');
xlabel('Re(s)'); ylabel('Im(s)'); zlabel('Re(Γ(s))');
colormap jet;                % 使用Jet颜色映射表示虚部值
colorbar;
shading interp;
view(-30, 30);
axis tight;

% ========== 图形优化 ==========
% 调整光照和材质反射
material dull;               % 减少高光反射
light('Position', [1 1 1]);  % 添加光源
lighting gouraud;            % 平滑光照

% ========== 自定义Gamma函数 ==========
function y = my_gamma(x)  % 重命名后的Gamma函数
    % 如果这是您自定义的Gamma函数实现，请在此编写计算逻辑
    % 如果直接调用MATLAB内置函数，请改为使用内置函数的不同调用方式
    y = gamma(x);  % 注意：这里需要确认是否需要保留符号计算
end
