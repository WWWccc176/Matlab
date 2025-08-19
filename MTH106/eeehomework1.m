g = 9.81;
L = 1.5;
a = 5;

f = @(t, u) [u(2); (a.*cos(u(1))-g.*sin(u(1))) ./ L];
% 指定求解的时间区间
tspan = [0 10];

% 指定初始条件
u0 = [0.5; 0];   % θ(0)=0.5, θ'(0)=0

% 使用ode45求解
[t, u] = ode45(f, tspan, u0);

% 解析出θ和θ'
theta = u(:, 1);
theta_p = u(:, 2);

% 绘制θ和θ'
subplot(2,1,1);
plot(t, theta);
ylabel('Theta');

subplot(2,1,2);
plot(t, theta_p);
xlabel('Time');
ylabel('Theta Prime');