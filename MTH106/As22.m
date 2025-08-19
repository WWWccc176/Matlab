clear;

x=[97  97  98 104;
101 102 101 101;
97 107 103 107;
106  96  97 105;
101 101 103 110;
97 102 102 106;
102 104 102  98;
103 100 106 102;
102 109  97 111;
99 100 107 110;
106 103  99 105;
102 105  97 103;
98  99  99 105;
91  97 103 103]';
A=x(1,:);
B=x(2,:);
C=x(3,:);
D=x(4,:);
[H1,sigma,CI]=ttest2(A,B,0.05,0)
%2
a=sort(A);
b=sort(B);
c=sort(C);
d=sort(D);
[p2,h2]=ranksum(a,b)

%3
hardness=[A,B,C,D];
flux={'A','A','A','A','A','A','A','A','A','A','A','A','A','A',...
    'B','B','B','B','B','B','B','B','B','B','B','B','B','B',...
    'C','C','C','C','C','C','C','C','C','C','C','C','C','C',...
    'D','D','D','D','D','D','D','D','D','D','D','D','D','D'};
[p3,table, stats]=anova1(hardness, flux, 'on')
%Bonferroni Method
alpha=0.05;
t=abs(tinv(0.05/12, 52));
region=t*sqrt(13.6758*(1/7))
aa=mean(A);
bb=mean(B);
cc=mean(C);
dd=mean(D);

means = [aa, bb, cc, dd];
absDifferences = [];
for i = 1:length(means)
    for j = i+1:length(means)
        absDiff = abs(means(i) - means(j));
        absDifferences = [absDifferences, absDiff];
    end
end
disp(absDifferences)
%Tukey-Kramer Method
[c4, m, h, nms] = multcompare(stats, 'CType', 'tukey-kramer');




