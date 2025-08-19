% derivative in hydraulics 
t = 0:5:20;
q = [0.6350 0.5336 0.4410 0.3572 0.2822];
h = 5;

% 2-point forward/backward differences
% forward for t=0:5:15; backwad for t=5:5:20
dq2 = (q(2:end)-q(1:end-1))/h; 
dq2f = [dq2 NaN]; dq2b = [NaN dq2];

% 3-point forward/centered/backward differences
% forward for t=0:5:10
dq3f = (-3*q(1:end-2)+4*q(2:end-1)-q(3:end))/2/h;
dq3f = [dq3f NaN NaN];
% centered for t=5:5:15
dq3c = (q(3:end)-q(1:end-2))/2/h;
dq3c = [NaN dq3c NaN];
% backward for t=10:5:20
dq3b = (q(1:end-2)-4*q(2:end-1)+3*q(3:end))/2/h;
dq3b = [NaN NaN dq3b];

% 5-point differences
D = 1/12/h*[-25 48 -36 16 -3; -3 -10 18 -6 1;
    1 -8 0 8 -1; -1 6 -18 10 3; 3 -16 36 -48 25];
dq5 = D*q(:); dq5 = dq5';

% Torricelli's law
dq = -0.6*(0.1/1)^2*sqrt(2*9.80665*q);

% print the results
fprintf('2f  '); disp(num2str(dq2f,'%.6f  ')); fprintf('\n');
fprintf('2b  '); disp(num2str(dq2b,'%.6f  ')); fprintf('\n');
fprintf('3f  '); disp(num2str(dq3f,'%.6f  ')); fprintf('\n');
fprintf('3c  '); disp(num2str(dq3c,'%.6f  ')); fprintf('\n');
fprintf('3b  '); disp(num2str(dq3b,'%.6f  ')); fprintf('\n');
fprintf('5  '); disp(num2str(dq5,'%.6f  ')); fprintf('\n');
fprintf('q''  '); disp(num2str(dq,'%.6f  ')); fprintf('\n');

