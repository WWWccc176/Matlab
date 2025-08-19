clc; 
clear;
format long

x = 1; % Initialize x_0
sequence_x = zeros(1, 25); % Pre-allocate space for the sequence
sequence_x(1) = x; % Store x_0——初始值

disp('First 25 terms of the sequence x_{n+1} = 3cos(x_n) with x_0 = 1 are:')
for n = 1:24 % Calculate x_1 to x_24 (so we have 25 terms in total)
    x = 3 * cos(x);
    sequence_x(n+1) = x; % Store x_n
end
disp(sequence_x') % Display as column vector for readability
