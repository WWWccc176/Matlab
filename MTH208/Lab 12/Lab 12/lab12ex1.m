% Use Taylor's method

f = @(t,y) -t*y+3*t.^3;
ya = 1.5;

% Taylor
m = 2; nrange = 5*2.^(0:4); hold on;
for n = nrange
    [t, y] = taylorstep(f,@df,m,0,1,n,ya);
    plot(t,y,'.-','LineWidth',1);
end
set(gca,'FontSize',18); hold off; shg

function re = df(f,t,y,j)
if j==1
    re = -y+3*3*t^2-t*f(t,y);
elseif j==2
    re = -2*f(t,y)+3*3*t-t*(-y+3*3*t^2-t*f(t,y));
end
end
