y_abs=[1,0,0,0,2,4,5,4,8,11,12,10,9,8,7,5,4,4,3,1,1,0,1]; 
binwidth = 0.5; 
area = binwidth*sum(y_abs); 
y_scaled = binwidth*y_abs/area;
bins = [64:binwidth:75]; 
bar(bins,y_scaled)
ylabel('scaled frequency'),
xlabel('height (in.)')

