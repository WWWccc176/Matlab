x = -2.5:.05:2.5;
y = -2.5:.05:2.5;
rou = 0.2;
[X,Y] = meshgrid(x,y);
z = (2*pi*sqrt(1-rou))^-1*exp(-(1-rou^2)^-1*(X.^2+Y.^2-2*rou.*Y.*Y));
surf(X, Y, z)
figure, contour3(X,Y,z)