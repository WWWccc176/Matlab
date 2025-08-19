clear;
unit_profit = [100,150,90,120];
hours = [1,2,0.5,3;0,2,4,1;3,1,5,2];
p = [0,0,0,0];
max_profit = 0;
for p1 = 0:15   % max number of product 1  = 45/3 =15
    for p2 = 0:15
        for p3 = 0:8  % max number of product 3  = 30/4 <8
            for p4 = 0:14
                p = [p1,p2,p3,p4];
                if hours*p' <= [40,30,45]'
                    profit = unit_profit*p';
                else
                    profit = 0;
                end
                if profit > max_profit
                    max_profit = profit;
                    production = [p1,p2,p3,p4];
                end
            end
        end
    end
end

disp('Optimal production is:')
disp(production)
disp('The profit is:')
disp(max_profit)


% check only one solution or not
another = [];
P = [];

for p1 = 0:15
    for p2 = 0:15
        for p3 = 0:8
            for p4 = 0:14
                p = [p1,p2,p3,p4];
                if hours*p' <= [40,30,45]'
                    profit = unit_profit*p';
                else
                    profit = 0;
                end
                
                if(max_profit-profit)<=1
                    another = [another;p];
                    P = [P,profit];
                end
            end
        end
    end
end
                    

[m,n] = size(another);
if m>1
    disp('The number of answers giving more profit is:')
    disp(m-1)
    disp('The other possible answers are:')
    disp(another(2:m,:))
    disp('Other profit:')
    disp(P(2:m)')
else
    disp('There is only one solutin.')
end
