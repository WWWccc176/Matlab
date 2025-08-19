% Gaussian quadrature 

% f = @(x) exp(x);
% I = exp(1)-1;
f = @(x) 1 + sin(exp(3*x));
I = gauss(f,a,b,2000);
m = 3; % number of quadrature points
a = 0; b = 1; % interval [a, b]
q = gauss(f,a,b,m); format long
disp('quadrature value: ');
disp(q);
disp('exact value: ');
disp(I);
disp('actual error: ');
disp(abs(I-q));

%% plot the errors against m
mrange = 1:40;
e = zeros(numel(mrange),1);
for m = mrange
    q = gauss(f,a,b,m);
    e(m) = abs(I-q);
end
semilogy(mrange,e,'*-','linewidth',2); shg
set(gca,'fontsize',16); grid on;
xlabel('m'); ylabel('error');
% hold on;
% R = @(m) 2.^(2*m+1)./(2*m+1).*(factorial(m)./factorial(2*m)).^3.*factorial(m);
% semilogy(mrange,R(mrange)/R(1),'o-');
% legend('actual error','$\frac{2^{2 m+1}[m !]^4}{(2 m+1)[(2 m) !]^3}$','interpreter','latex','fontsize',20)