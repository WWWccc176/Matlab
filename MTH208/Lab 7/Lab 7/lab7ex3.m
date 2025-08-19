% logistic regression 
x = [0.50 	0.75 	1.00 	1.25 	1.50 	1.75 	1.75 	2.00 	2.25 	2.50 	2.75 	3.00 	3.25 	3.50 	4.00 	4.25 	4.50 	4.75 	5.00 	5.50];
y = [0 	0 	0 	0 	0 	0 	1 	0 	1 	0 	1 	0 	1 	0 	1 	1 	1 	1 	1 	1];
a = logisfit(x,y,0.01,1000,1e-10);
p = logisval(a,x);

plot(x(y==0),y(y==0),'o','MarkerFaceColor','r'); hold on
plot(x(y~=0),y(y~=0),'o','MarkerFaceColor','b');

plot(x(p<0.5),p(p<0.5),'rx','MarkerSize',10);
plot(x(p>0.5),p(p>0.5),'bx','MarkerSize',10);
xlabel('study hours'); ylabel('probability of pass');
set(gca,'fontsize',16);
legend('data: fail', 'data: pass', 'p<0.5', 'p>0.5', 'fontsize',18);