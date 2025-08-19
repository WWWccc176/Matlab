%Q1
integrand1 = @(x) exp(-x.^2);
re1 = integral(integrand1,0,10)
re2 = integral(integrand1,0,inf)
x = 0:.05:10;
y = exp(-x.^2);
appr = trapz(x,y)
%Q2
integrand2 = @(x,y) (sqrt(6)/(2*pi))*exp(-(2*x.^2+3*y.^2)./2);
re3 = integral2(integrand2,0,1,1,2)
re4 = integral(@(y)integral(@(x)integrand2(x,y),0,1), 1,2,'ArrayValued',true)

%Q3
f = @(x) (x.^2018+x.^2017+1).*(x+.2019).^100;
inte = integral(f,0,1)

%Q4
h = 0.001;
d = 0;
D = [d d+h];
g = @(x) exp(x);
G = g(D);
derivative = diff(G)/diff(D)

%Q5
load TSLAapril.mat
D1 = diff(TSLAapril);
[Dprice,t_max]=max(abs(D1));
Dprice1 = D1(t_max);
t_max;
%5(2)
change = 0;
for i = 1:29
    change_i = [abs(diff(TSLAapril))];
    if change_i(i) >= change
        change = change_i(i);
        t_max1 = i;
    end
end
t_max1
change
