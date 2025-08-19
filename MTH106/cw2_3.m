clear
a = randn(8000);
b = 4*a+7;
n = 4000*(erf(3/(4*sqrt(2)))-erf(-sqrt(2)/8))
years = [1 2 5 8];
infrate = [.015 .019 .02 .023];
interp1(years, infrate, 6)
x = [20, 21, 22];
y = [2, 3, 4];
z = [6, 7, 5; 8, 10, 9; 12, 14, 15];
interp2(x, y, z, 20.5, 3.25)
