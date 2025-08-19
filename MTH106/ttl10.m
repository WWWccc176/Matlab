clear
a = rand(1000,1);
rand_num = 2 + (18-2)*a;
mean_value = mean(rand_num)
histogram(rand_num)
ylabel('absolute frequency')


A = randn(1,1000);
B = 2*A+20;
figure,
histogram(B, 40)
ylabel('absolute frequency')
xlabel('random number')