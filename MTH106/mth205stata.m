clear;

%chapter1
A=[1.09 1.92 2.31 1.79 2.28 1.74 1.47 1.97 0.85 1.24 1.58 2.03 1.70 2.17 2.55 2.11 1.86 1.90 ...
   1.68 1.51 1.64 0.72 1.69 1.85 1.82 1.79 2.46 1.88 2.08 1.67 1.37 1.93 1.40 1.64 2.09 1.75 ...
   1.63 2.37 1.75 1.69]';
median(A)%中位数
quantile(A,[0.25 0.5 0.75])%须
iqr(A)%Q3-Q1
boxplot(A)%箱型图
chi2cdf(2,16)
fcdf(3,12,11)
%%normcdf(X,mu,sigma)
normcdf(2.3)
tcdf(3,4)
%chapter2
%chapter3
%%[h,sig,ci,zval] = ztest(x,m,sigma,alpha,tail)
%%[h,sig,ci,zval] = ttest(x,m,alpha,tail)
%%%x is the sample vector, m is miu", sigma is sigma, alpha is significant level 100alpha%

%chapter4
%chapter5
hardness=[250 264 256 260 239 263 254 267 265 267 257 279 ...
269 273 277 253 258 262 264 273];
flux={'A','A','A','A','A','B','B','B','B','B','C','C','C','C','C','D','D','D','D','D'};
[p,table]=anova1(hardness, flux, 'on')
t=abs(tinv(0.004167,16))
%chapter6
X=[1 10 2 16;1 5 6 16;1 3 1 12;1 6 5 14;1 8 8 16;1 20 0 12;1 8 4 18;1 14 6 17]; 
y=[57310 57380 54135 56985 58715 60620 59200 60320]'; 
B=regress(y,X)
%chapter7
normplot(A)
