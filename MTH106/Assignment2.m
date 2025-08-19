clear;
clc;
a = [2 2 3 2 1 3 3 1 2 4 6 1 4 6 5 2 4 6 6 2 2 ...
1 2 3 6 3 2 0 2 5 2 1 2 3 2 4 4 3 3 3 2 3 5 1 ...
2 2 3 1 3 6 4 6 3 3 3 1 2 3 2 6 3 2 2 4 4 1 1 ...
4 3 1 1 1 2 1 2 1 2 1 3 4 0 3 5 2 0 1 2 1 1 2 ...
2 1 0 2 3 4 1 1 1 6]';
boxplot(a)

m = mean(a)


obsFreq = histcounts(a, 'BinMethod', 'integers');
maxData = max(a);
expFreq = poisspdf(0:maxData, m) * length(a);

[h, p, chi2stat] = chi2gof(0:maxData,'Ctrs',0:maxData,'Frequency',obsFreq,'Expected', ...
    expFreq,'Emin',5)
disp(p);