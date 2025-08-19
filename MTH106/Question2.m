%2
Cash = 100; 
InterestRate = 0.04;
n = 25;
FutureValue1 = FutureValue(Cash, InterestRate, n);
disp(FutureValue1)
%3
Cash1 = 250; 
InterestRate1 = 0.044;
n1 = 16;
FutureValue2 = FutureValue(Cash1, InterestRate1, n1);
disp(FutureValue2)
%part4
Payment=0;

k=1;

while k<20,Cash=100; 

for i=1:n

Cash=100+Cash*(1+InterestRate(i));

end

Payment(k)=Cash;

k=k+1;   

end

sum(Payment(k)) %Future value of the total investment