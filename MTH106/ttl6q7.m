clear;
deposit = [300*ones(1,12),350*ones(1,12),350*ones(1,12),350*ones(1,12),400*ones(1,12)];
amount = [0,0];
rate = [0.04/12, 0.05/12];  %monthly interest rates

CD = [0,0];  % Certificate of Deposit 

for j = 1:length(rate)
 
for i = 1:length(deposit)
    
        amount(j) = amount(j)*(1+rate(j)) + deposit(i);
        if mod(i,12)==0
            
            CD(j) = 1.06*CD(j);
            if amount(j)>=3000
                amount(j) = amount(j) - 2000;
                CD(j) = CD(j) + 2000;
            end
        end
    end
end
 
disp('The output for a 4% interest rate is')
disp('The amount in saving is:')
disp(amount(1))
disp('The amount in CDs is:')
disp(CD(1))
disp('The total amount you have is:')
disp(amount(1)+CD(1))
disp('The output for a 5% interest rate is')
disp('The amount in saving is:')
disp(amount(2))
disp('The amount in CDs is:')
disp(CD(2))
disp('The total amount you have is:')
disp(amount(2)+CD(2))
