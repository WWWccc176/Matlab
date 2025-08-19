clear
%1
y_abs = [1 1 2 0 3 4 5 6 8 11 12 10 11 8 7 5 4 4 4 1 2 0 1];
y_scaled = y_abs/sum(y_abs);
binwidth = 0.5;
bins = 64:binwidth:75;
bar(bins, y_scaled)
%2
y_raw = [];
for i = 1:length(y_abs) 
if y_abs(i)>0 
new = bins(i)*ones(1,y_abs(i)); 
else
new = []; 
end 
y_raw = [y_raw,new]; %add new elements into the formal array
end
mu = mean(y_raw)
sigma = std(y_raw)

prob = cumsum(y_scaled)*binwidth;
prob69 = prob(11)

% estimate with erf
prob69_II = (1+erf((69 - mu)/(sigma*sqrt(2))))/2
 
% d
prob68_72 = prob(17)-prob(9)
% estimate with erf
prob68_72_II = (erf((72 - mu)/(sigma*sqrt(2))) - erf((68 - mu)/(sigma*sqrt(2))))/2 

