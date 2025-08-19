%Q1
x = [1 2 3];
y = [3 3 0];
z = [5 3 10];
a = logical((x>y)&(x < z))
%Q2
b = [10, -2, 6, 5, -3];
c = [9, -3, 2, 5, -1];
z1 = (b<6)
z2 = (b<=c)
z3 = (b==c)
z4 = (b~=c)
%Q3
price_A = [19, 18, 22, 21, 25, 19, 17, 21, 27, 29];
price_B = [22, 17, 20, 19, 24, 18, 16, 25, 28, 27];
d = (price_A>price_B);
d1 = sum(double(d))
%Q4
e = [-3, 0, 0, 2, 5, 8];
f = [-5, -2, 0, 3, 4, 10];
g1 = e<~f
g2 = e&f
g3 = e|f
g4 = xor(e,f)
%Q5
price_C = [19, 18, 22, 21, 25, 19, 17, 21, 27, 29];
price_D = [22, 17, 20, 19, 24, 18, 16, 25, 28, 27];
price_E = [17, 13, 22, 23, 19, 17, 20, 21, 24, 28];
h = (price_C>price_D)&(price_C>price_E);
h=h+0;
h1 = sum(h)
k = (price_C>price_D)|(price_C>price_E);
k1 = sum(double(k))
l = xor((price_C>price_D),(price_C>price_E));
l1 = sum(double(l))
%Q5
m = [-4, -1, 0, 2, 10];
n = [-5, -2, 2, 5, 9];
values=m(m<n)
indices=find(m<n)