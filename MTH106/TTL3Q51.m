x = -2.5:.05:2.5;
y = -2.5:.05:2.5;
rou = 0;
[X,Y] = meshgrid(x,y);%将x, y保存在X,Y向量中，二维坐标每一个点都是向量矩阵相乘的结果
z = (2*pi*sqrt(1-rou))^-1*exp(-(1-rou^2)^-1*(X.^2+Y.^2-2*rou.*Y.*Y));
surf(X, Y, z)%画图：一个surface
figure, contour3(X,Y,z)%contour用于画等高线图，加上3是三维等高线，不加3是平面等高线