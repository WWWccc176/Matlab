%a
t = 0:0.01:4;
d = 100000000000;
t_min = 0;
for i = 1:length(t)
    d_i = sqrt((5*t(i)-10)^2+(25*t(i)^2-120*t(i)+144)^2);
    if d_i < d
        d = d_i;
        t_min = t(i);
    end
end
disp(t_min)
disp(d)
%b
j = 1:length(t);
dmin = min(sqrt((5.*t(j)-10).^2+(25.*t(j).^2-120.*t(j)+144).^2))