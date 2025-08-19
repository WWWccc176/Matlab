x = 1:.15:20;
y = 1:.15:20;
theta = 0:0.01:2*pi;
r = 1-sin(theta);
[X,Y] = meshgrid(x,y);
z = sin(Y).^3.*sqrt(X);
surf(X, Y, z)
figure, contour3(X,Y,z)
hold on
figure, polarplot(theta,r,"LineWidth",2,"Color","r")