x = [0 0.25 0.75 1.25 1.5 1.75 1.875 2 2.125 2.25];
y = [1.2 1.18 1.1 1 0.92 0.8 0.7 0.55 0.35 0];
xint = 0:.25/5:2.25;
z = interp1(x,y,xint,'spline');
plot(x,y,'-o',xint,z,'-xr')
title('fit with spline interpolation')
ylabel ('y'); xlabel('x');
legend;