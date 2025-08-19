clear
x = 1:9;
y = [5,6,10,20,28,33,34,36,42];
c1 = polyfit(x, y, 1);
c2 = polyfit(x, y, 2) ;
c3 = polyfit(x, y, 3);
c4 = polyfit(x, y, 4);
y_h1 = c1(1)*x + c1(2);
y_h2 = c2(1)*x.^2 + c2(2).^x+c2(3); %Or: y_h2 = polyval(c2,x);
y_h3 = polyval(c3,x);
y_h4 = polyval(c4,x);
r1 = sum ((y - y_h1).^2)
r2 = sum ((y - y_h2).^2)
r3 = sum ((y - y_h3).^2)
r4 = sum ((y - y_h4).^2)