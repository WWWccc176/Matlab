% complex method for derivative

f = @(x) log(1+(x-4)^2);
Df = @(x) 1/(1+(x-4)^2)*2*(x-4);
x = 2; Dfp = Df(x);
% real step finite difference
t = 10.^(-1:-1:-15);
rFDp = zeros(size(t));
for m = 1:length(t)
    rFDp(m) = (f(x+t(m))-f(x))/t(m);
end

% complex step finite difference
cFDp = zeros(size(t));
for m = 1:length(t)
    cFDp(m) = imag(f(x+1i*t(m)))/t(m);
end

% plots
loglog(t,abs(rFDp-Dfp),'x-','linewidth',2); hold on;
loglog(t,abs(cFDp-Dfp),'s-','linewidth',2); 
loglog(t,t.^2,'--'); loglog(t,t,'-.'); hold off;
xlabel('step size'); ylabel('error of FD to exact');
%set(gca,'XDir','reverse','FontSize',14);
h = legend('real step FD','complex step FD','h^2','h'); 
set(h,'FontSize',16,'Location','Best','fontsize',18); 
ylim([1e-20,1]);
set(gca,'fontsize',18);