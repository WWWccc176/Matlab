clear;
data = randn (1, 1000);
histogram(data);
hold on
[N, h] = hist(data);
rel = N/sum(N);
figure; bar(h, rel, 1);
hold off