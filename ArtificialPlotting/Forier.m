clc;
clear;

% 设参数 (无改动)
m = 15;
N = 1024;
T0 = 4; % 信号总周期
T = 2;  % 脉冲宽度

% --- 时间向量和信号 (为了绘图和计算正确，做了优化) ---
% 为了让傅里叶合成(for循环)正确工作，需要一个单调递增的时间轴
t_mono = linspace(-1.5*T0, 1.5*T0, 8*N)'; % 创建一个平滑、单调的时间向量
s_mono = (mod(t_mono, T0) < T); % 用取余运算创建完美的周期方波
ys_mono = s_mono - 0.5;

% --- 绘图设置 ---
figure('Color', 'white', 'Position', [100, 100, 1200, 800]);
hold on;
grid on;

% --- 1. 绘制原始方波信号 (问题1修正) ---
% 改动: 使用平滑的 t_mono 和 ys_mono 向量绘图，避免了原始定义中的断点问题
y_plane_original = T0 + 2; % 将原始信号放在最顶层，y = 6
plot3(t_mono, y_plane_original*ones(size(t_mono)), ys_mono, 'b', 'LineWidth', 2.5);

% --- 2. 频谱 (问题2修正) ---
A = T/T0;   % 占空比 (0.5)
f0 = 1/T0;  % 基波频率 (0.25 Hz)
fsamp=2048;

% A. 计算离散谐波和连续包络线
freq_k = 0:m; % 谐波次数k
harmonic_freqs = freq_k * f0; % 真实谐波频率 (Hz)
harmonic_amplitudes = A * sinc(A * freq_k);

f_continuous = linspace(0, m*f0, fsamp); % 连续频率轴 (Hz)
F_envelope = T * sinc(T * f_continuous); % 正确的包络线

% B.【修正】将频率轴映射到与时间轴相同的视觉范围
x_range = [min(t_mono), max(t_mono)]; % 目标绘图范围 (-6 到 6)
% 将谐波频率和连续频率都映射到这个范围
mapped_harmonic_freqs = (harmonic_freqs / max(harmonic_freqs)) * (x_range(2) - x_range(1)) + x_range(1);
mapped_f_continuous = (f_continuous / max(f_continuous)) * (x_range(2) - x_range(1)) + x_range(1);

% C. 绘制映射后的频谱
y_plane_freq = -(T0 + 2); % 将频谱图放在最底层, y = -6
stem3(mapped_harmonic_freqs, y_plane_freq*ones(size(mapped_harmonic_freqs)), harmonic_amplitudes, 'r', 'filled', 'LineWidth', 1.5);
plot3(mapped_f_continuous, y_plane_freq*ones(size(mapped_f_continuous)), F_envelope, 'r--', 'LineWidth', 1.0);
fill3([mapped_f_continuous(1), mapped_f_continuous, mapped_f_continuous(end)], ...
      [y_plane_freq, y_plane_freq*ones(size(mapped_f_continuous)), y_plane_freq], ...
      [0, F_envelope, 0], 'r', 'FaceAlpha', .2, 'EdgeColor', 'none');

% --- 3. 绘制傅里叶合成过程 (问题3修正) ---
X = A * ones(size(t_mono)); % 用直流分量(k=0)初始化合成信号
y_plane_synthesis = 0; % 合成信号的中心平面

% 【修正】创建m个渐变色
colors = parula(m);

% 绘制直流分量 (k=0)
plot3(t_mono, y_plane_synthesis*ones(size(t_mono)), X-0.5, 'k--', 'LineWidth', 1.0, 'DisplayName', '直流分量 (k=0)');

% 【修正】循环绘制各次谐波，并累加
for k = 1:m
    % 单独计算第k次谐波
    x_k = 2*A*sinc(A*k)*cos(2*pi*k*t_mono/T0);
    
    % 将第k次谐波绘制在自己的平面上，形成瀑布图效果
    plot3(t_mono, (y_plane_synthesis - k*0.3)*ones(size(t_mono)), x_k, 'Color', colors(k,:), 'LineWidth', 1.5);
    
    % 累加到总信号中
    X = X + x_k;
end

% 在循环结束后，绘制最终合成的信号
plot3(t_mono, y_plane_synthesis*ones(size(t_mono)), X-0.5, 'g', 'LineWidth', 2.5, 'DisplayName', '最终合成信号');

% --- 坐标轴和标签设置 ---
xlabel('时域轴 / 映射后的频域轴');
ylabel('信号域');
zlabel('幅度');
axis([x_range, y_plane_freq-1, y_plane_original+1, -1, 1.5]);
title('傅里叶级数展开与频谱分析', 'FontSize', 16, 'FontWeight', 'bold');
view(-25, 25); % 调整视角

% --- 标注 ---
text(0, y_plane_original, 1, '原始时域信号', 'FontSize', 12, 'Color', 'b', 'HorizontalAlignment', 'center');
text(0, y_plane_freq, 1, '频域频谱', 'FontSize', 12, 'Color', 'r', 'HorizontalAlignment', 'center');
text(x_range(1)+1, y_plane_synthesis-m*0.3-0.5, '各次谐波分量 (k=1 \rightarrow m)', 'FontSize', 12, 'Color', 'k', 'Rotation', 45);
text(0, y_plane_synthesis, 1, '傅里叶合成信号', 'FontSize', 12, 'Color', 'g', 'HorizontalAlignment', 'center');

legend('原始信号','谐波谱线', '频谱包络', '直流分量', '最终合成信号');