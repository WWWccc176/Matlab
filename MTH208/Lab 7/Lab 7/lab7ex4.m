% trigonometric fitting
t = 0:1/8:7/8;
T = [-2.2 -2.8 -6.1 -3.9 0 1.1 -0.6 -1.1];
c = trigfit(t,T,2);
tt = 0:0.01:1;
TT = real(trigval(c,tt));
plot(t,T,'o-',tt,TT,'linewidth',2,'MarkerFaceColor','b');
legend('data','trig','fontsize',16);
set(gca,'fontsize',16);