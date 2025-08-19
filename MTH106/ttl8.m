clear
%Q1
tspan = [0 20];
y0 = 1500;
[t, y] = ode45(@(t,y) .7*(1-y/2019)*y, tspan, y0);
A = (2019 -y0)/y0;
y_exact = 2019./(1+A*exp(-0.7*t));
plot(t,y, 'r',t,y_exact,'*b');
legend('approximate','exact');xlabel('t');ylabel('y')
%Q2
y01 = 2;
[t, y] = ode45(@(t,y) 5*t-3*sqrt(y), tspan, y01);
figure,
plot(t, y)
%Q3
if exp(sym(pi)*sym(1i)) == -1
    disp('e^(pi*i) is equal to -1')
else
    disp('e^(pi*i) is not equal to -1')
end
%Q4
syms x m n u v w y t
f1 = (x^2+x^4)^4;
f2 = exp(m*x)*cos(n*x);
f3 = tan(sin(x)^-1)^-1;
f4 = exp(u*w)*sin(v/u);
f5 = sin(x+sin(t));
diff(f1,x)
diff(f2,x)
diff(f3,x)
diff(f4,w)
diff(diff(diff(f5,x),t),x)
diff(diff(f5,x,2),t)
%Q5
f6 = 2*pi*sin(x);
f7 = sqrt(1-x^2);
f8 = exp(-x^2);
f9 = 4-x-2*y;
int(f6,x)
int(f7,x)
int(f8,x,-inf,inf)
int(int(f9,x,1,2),y,0,1)


%Q6
syms a b c
solve(a*x^2+b*x+c == 0)
%Q7
syms y(t)
ode = diff(y, t) == t + y;
cond = y(0) == 4;
y(t) = dsolve(ode, cond);
disp(y(t))
%Q8
syms h
limit((tan(x+h)-tan(x))/h, h, 0)

