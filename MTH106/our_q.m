function a = our_q(datasize, means, dev, quan)
quan_used = sort(quan);
data = means+dev*randn(1, datasize);
a = quantile(data, quan_used);
end