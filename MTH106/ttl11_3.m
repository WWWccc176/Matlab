clear;
datasize = 1000000;
means = 0;
dev = 1;
quan = [0.25 0.5 0.99];
a = our_q(datasize, means, dev, quan);
disp(a)