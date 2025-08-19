clear
x = [2 36 6 7 78 89 0 35 6 54 3 55 6];
cumsum(x)

y_abs = [1,0,0,0,2,4,5,4,8,11,12,10,9,8,7,5,4,4,3,1,1,0,1]; 
binwidth = 0.5; 
bins = 64:binwidth:75; 
y_raw = [];
for i = 1:length(y_abs) 
if y_abs(i)>0 
new = bins(i)*ones(1,y_abs(i)); 
else
new = []; 
end 
y_raw = [y_raw,new]; 
end
mu = mean(y_raw)
sigma = std(y_raw)
bar(bins,y_raw)

