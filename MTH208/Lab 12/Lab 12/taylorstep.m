function [t, y] = taylorstep(f,df,m,a,b,n,ya)
% Taylor explicit time-stepping for 
% y'=f(t,y), y(a) = ya
% df(f,t,y(t),j) is the total derivative about t for j times
% m = max j, (y(i+1)-y(i))/dt is approximated within error of O(h^(m+1))

t = zeros(n+1,1); t(1) = a; 
h = (b-a)/n; d = numel(ya);
y = zeros(n+1,d); y(1,:) = ya;
for i = 1:n
    s = zeros(1,d);
    for j=m:-1:1 % add smaller term first
        s = s + h^(j+1)*df(f,t(i),y(i,:),j)/factorial(j+1);
    end
    y(i+1,:) = y(i,:) + s + h*f(t(i),y(i,:));
    t(i+1) = t(i) + h;
end