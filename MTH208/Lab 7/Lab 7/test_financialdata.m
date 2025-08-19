% linear regression for Lab 7
 T = readtable('data.csv');
XY=T{1:100,:}
x=XY(:,2);
y=XY(:,3);
plot(x,y,'-o');
n=size(x,1);
a = trigfit(x,y,1000);
yy = trigval(a,x);
subplot(1,2,1)
plot(x,y,'-r')
 subplot(1,2,2)
plot(x,yy,'-b','linewidth',1)
 