 T = readtable('data.csv');
XY=T{1:100,:}
x=XY(:,2);
y=XY(:,3);
xx=[min(x):0.6:max(x)]; 
yy2 = cubicspline(x,y,xx,2);
yy3 = cubicspline(x,y,xx,3);
 
plot(x,y,'-',xx,yy2,'-o');
figure
plot(x,y,'-',xx,yy3,'-or');