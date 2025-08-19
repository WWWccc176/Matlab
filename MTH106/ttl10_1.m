x = 1:12;
x(5) = [];
x(8) = [];
y = [10 12 18 24 21 20 18 15 13 8];
xint = [5 9];
yint = interp1(x,y,xint);
plot(x,y,'ro-', xint, yint,'bd')
y_spline = spline(x,y,xint);
figure
plot(x,y,'ro-', xint, y_spline,'gx')