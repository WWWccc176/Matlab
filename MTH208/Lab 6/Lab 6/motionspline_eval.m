function x = motionspline_eval(t12,x1,xp01,xpp01,a,b,c,d,t)
% see motionspline.m
% Here, the motion splines are evaluated at t

x = zeros(size(t));
t1 = t12(1); t2 = t12(2);

i = (t>=0) & (t<=t1);
x(i) = xp01(1)*t(i) + 1/2*xpp01(1)*t(i).^2 + d(1)*t(i).^3;

i = (t>=t1) & (t<=t2);
x(i) = a + b*(t(i)-t1) + c*(t(i)-t1).^2 + d(2)*(t(i)-t1).^3;

i = (t>=t2) & (t<=1);
x(i) = x1 + xp01(2)*(t(i)-1) + 1/2*xpp01(2)*(t(i)-1).^2 + d(3)*(t(i)-1).^3;