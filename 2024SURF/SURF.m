t=linspace(0, 20*pi, 200);
x=sin(t)+t.*cos(t);%''.*''，按两个矩阵每个对应位置元素相乘形成的一个新矩阵
y=cos(t)-t.*sin(t);
z=t;
subplot(2, 2, 1)
plot3(x, y, z)
grid on


