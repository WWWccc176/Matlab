b = [25 7 8 58 89 37 56 0 89 47 48 78 67 8 67];
a = 4:length(b)+3;
bar(a,b)
hold on

c = [1 2 3;5 4 6;7 8 9];
figure,
subplot(1,2,1)
bar(c)
subplot(1,2,2)
bar(c,'stacked')
legend('weight')
hold on

x = [1980 1990 2000]; 
y = [15 20 -5; 10 -17 21; -10 5 15]; 
figure,
bar(x,y,'stacked')

figure,
d = [0 2 9 2 5 8 7 3 1 9 4 3 5 8 10 0 1 2 9 5 10]; 
histogram(d) %frequency

axis([0 10 0 3])

figure,
e = [92,94,93,96,93,94,95,96,91,93,95,95,95,92,93,94,91,94,92,93]';
f = 91:96;
histogram(f,e),
axis([90 97 0 6])
ylabel('Absolute Frequency'),
xlabel('Thread Strength (N)');
title('Absolute Frequency Histogram for 20 Tests')





