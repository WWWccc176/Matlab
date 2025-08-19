%1
f = @(t,y) y + t;
tspan = [950,1000];
y0 = 10;
h = 1;
[x, y] = euler0(f, tspan, y0, h);
plot(x,y,'-ob')
hold on
%2
h2 = .1;
[x2, y2] = imp_euler(f, tspan, y0, h2);
plot(x2,y2,'-or')
%3
tspan = [0 20]; % time period
y0 = 5000;
[t,y] = ode45(@(t,y) 0.05*y-200, tspan, y0); 
% compare numerical solution with true one.
figure,
plot(t,y,'*r',t,4000+(y0-4000)*exp(0.05*t),'b');
legend('approximate','exact');
xlabel('t');
ylabel('y');
%4
syms x y
fun = (cos(exp(x) + x^2 + x-1))^2;
diff(fun)
%5
fun1 = (cos(exp(x) + x^2 + x - y^2))^2;
pfpx = diff(fun1, x)
p2fpy2 = diff(fun1, y, 2)
pfpxpy = diff(diff(fun1, x),y)
%6
syms x y n;
f = x^n + y^n;
int(f,x)
int(f,y)
int(f,n)
%7
fun2 = sin(sin(x));
int(fun2, x)
%8
solve(x^2 - 5*x + 6 == 0)
%9
syms y(t)
y(t) = dsolve(diff(y,t,1) == y, y(0) == 1)
%or: dsolve(‘Dy=y’,’y(0)=1’)

%solving ODE systems
syms a(t) z(t)
eqns = [diff(a,t) == z^2, diff(z,t) == -sqrt(y)];
S = dsolve(eqns)
%10
syms x h n;
limit((cos(x+h) - cos(x))/h, h, 0)
limit((1+x/n)^n, n, inf)
%11
a = sqrt(sym(2)) - 1;
f1 = a^2 + 2*a -1;
simplify(f1)
%12
f11 = (x-1)*(x^2 + x +1);
expand(f11)
%13
f2 = x^4 - 1;
factor(f2)
%14
f3 = x^2 + 2*x - 3;
subs(f3,-3)


