% linear regression for Lab 7
T = readtable('global.csv');
XY = T{13:1704,:}; % 1881-2021
plot(XY(:,1),XY(:,2),'o-','linewidth',2);
xlim([1880 2022]);
set(gca,'fontsize',16);
x = XY(949:end,1); y = XY(949:end,2);
m = numel(x); e = ones(m,1);
L = [e'*e  e'*x; x'*e x'*x];
z = [e'*y; x'*y]; a = L\z;
yh = a(1)+a(2)*x;
hold on; plot(x,yh,'linewidth',2);
%rmse(y,yh)%only available since 2022b and 
% with Statistics and Machine Learning toolbox installed
% Use the following instead
disp('rmse: '); sqrt((y-yh)'*(y-yh)/numel(yh))