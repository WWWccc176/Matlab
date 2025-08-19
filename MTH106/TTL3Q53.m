x = -.5:.01:0.5;
y = -.5:.01:.5;
rou = .95;
[X,Y] = meshgrid(x,y);
z = (2*pi*sqrt(1-rou))^-1*exp(-(1-rou^2)^-1*(X.^2+Y.^2-2*rou.*Y.*Y));
surf(X, Y, z)
figure, contour3(X,Y,z)