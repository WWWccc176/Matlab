% Runge-Kutta

% Midpoint/Runge-Kutta
nrange = 5*2.^(0:4); hold on;
for n = nrange
    %[t, y] = midstep(f,0,1,n,ya);
    [t, y] = rkstep(f,0,1,n,ya);
    plot(t,y,'.-','LineWidth',1);
end
set(gca,'FontSize',18); hold off;