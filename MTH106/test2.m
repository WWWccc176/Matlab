A=importdata('GOOG.csv');
close=A.data(:,4);
high=A.data(:,2);
open=A.data(:,1);
low=A.data(:,3);
date=A.textdata(2:252,1);
xnum=datenum(date);
plot(xnum,open,'y');
hold on
plot(xnum,high,'r');
hold on
plot(xnum,low,'g');
hold on
plot(xnum,close,'b');
hold off
legend('open','high','low','close')
datetick('x',29)
S = [1 2 3;inf inf 4;5 6 7];
finite(A)