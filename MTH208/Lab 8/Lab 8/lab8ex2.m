% use dmat.m to generate the differentiation matrix
% f = @(x) sin(pi*x); 
% fp = @(x) pi*cos(pi*x);
f = @(x) 1./(1+25*x.^2);
fp = @(x) -50*x./(1+25*x.^2).^2;
%x = linspace(-1,1,11)';
x = linspace(0,1,101)'; x = cos(pi*x); x = flip(x);
%D = dmat(x); 
D = chebdmat(-1,1,numel(x)-1);
Df = D*f(x);
fprintf('Df  '); disp(num2str(Df','%.6f  ')); fprintf('\n');
fprintf('f''  '); disp(num2str(fp(x)','%.6f  ')); fprintf('\n');
fprintf('err  '); disp(num2str(fp(x)'-Df','%g  ')); fprintf('\n');

plot(x,fp(x)'-Df','*','linewidth',2)
set(gca,'fontsize',18)