function [a, b, c, d] = motionspline(t12,x1,xp01,xpp01)
% t12=[t1 t2], x1=x(1),x0=0 is assumed,
% xp is x', xpp is x'' all at t=0,1,
% return splines in three pieces:
% x0 + xp*t + 1/2*xpp*t^2 + d(1)*t^3, if 0<t<t1
% a + b*(t-t1) + c*(t-t1)^2 + d(2)*(t-t1)^3, if t1<t<t2
% x1 + xp1*(t-1) + 1/2*xpp1(t-1)^2 + d(3)*(t-1)^3, if t2<t<1

t1 = t12(1); t2 = t12(2);
xp0 = xp01(1); xp1 = xp01(2);
xpp0 = xpp01(1); xpp1 = xpp01(2);
A = [t1^3-3*t1^2*t2+3*t1*t2^2  (t2-t1)^3  (1-t2)^3;
     -3*t1^2+6*t1*t2  3*(t2-t1)^2  -3*(1-t2)^2;
     6*t1  6*(t2-t1)  6*(1-t2)];
rhs = [-xp0*t2-1/2*xpp0*t2^2+x1+xp1*(t2-1)+1/2*xpp1*(t2-1)^2;
       -xp0-t2*xpp0+xp1+xpp1*(t2-1);
       -xpp0 + xpp1];
d = A\rhs;
a = xp0*t1+1/2*xpp0*t1^2+d(1)*t1^3;
b = xp0+xpp0*t1+3*d(1)*t1^2;
c = 1/2*xpp0 + 3*d(1)*t1;
