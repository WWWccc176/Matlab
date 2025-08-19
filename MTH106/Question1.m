Data = readtable('Data_Coin_Price.xlsx');

X = Data{:,1}; %圆括号不好用，花括号可以
Y = Data{:,2}; 
Z = Data{:,3}; 

InitialCoinsX=2000;
InitialCoinsY=2000;
InitialCoinsZ=1000;

DifVec = X-Y;% Price difference between X and Y
SellX=0;% days that X will be sold
SellY=0;% days that Y will be sold

k1=1;
k2=1;
for i=1:size(DifVec)
if DifVec(i)>1.5
    SellX(k1)=i;
    k1=k1+1; %counting parameter
elseif -DifVec(i)>1
    SellY(k2)=i;
    k2=k2+1; %counting parameter
end
end
numX = 2000 - 5*k1
numY = 2000 - 10*k2
numZ = 1000 + 5*k1 + 10*k2
fee = (k1+k2)*3

disp(k1)
disp(k2)
%Q5
IntPort=X(1)*2000+Y(1)*2000+Z(1)*1000; %total value of portfolio at the beginning of day1

%Below is Sell Y coins and buy Z coins

for i=1:length(SellY)
    % Sell Y coins and buy Z coins
    InitialCoinsZ=InitialCoinsZ+((Y(SellY(i))*10-3)/Z(SellY(i)));
    InitialCoinsY=InitialCoinsY-10;
end

for i=1:length(SellX)
    % Sell X coins and buy Z coins
    InitialCoinsZ=InitialCoinsZ+((X(SellX(i))*5-3)/Z(SellX(i)));
    InitialCoinsX=InitialCoinsX-5;
end
disp(InitialCoinsX)
disp(InitialCoinsY)
disp(InitialCoinsZ)
LastPort=X(end)*1315+Y(end)*380+Z(end)*3305 %total value of portfolio at the end of 400th day