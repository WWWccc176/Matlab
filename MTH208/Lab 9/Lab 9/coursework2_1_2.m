wfuncos=@(x) sqrt(x).*(4/3+2/3*cos(x));
f1=@(x) cos(x)./sqrt (x);
intf1w=zeros(10,1);
for n=100:100:1000
trapezf1=trapez(f1,1/n, 1, n);
wcos=wfuncos (1/n) ;
intf1w (n/100)= trapezf1+wcos;
end
plot(100:100:1000,intf1w)
 
 % sin
 wfunsin=@(x) sqrt(x).*(sin(x))*2/3;
g1=@(x) sin(x)./sqrt (x);
intg1w=zeros(10,1);
for n=100:100:1000
trapezg1=trapez(g1,1/n, 1, n);
wsin=wfunsin (1/n) ;
intg1w (n/100)= trapezg1+wsin;
end
plot(100:100:1000,intg1w)
 