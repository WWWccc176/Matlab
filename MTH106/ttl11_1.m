clear
sam_size = [100 1000 10000 100000 1000000 10000000];
for i = 1:length(sam_size)
    data = rand(1, sam_size(i));
    s = skewness(data);
    k = kurtosis(data);
    fprintf('%5.5f', '%5.5f\n', s, k);
    figure; histfit (data);
end