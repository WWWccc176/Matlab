
%%%User Defined Function%%%

function FutureValue = FutureValue(Cash, InterestRate, n)
    for i = 1:n
        Cash = Cash*(1+(InterestRate+(i-1)*0.001));
    end
    FutureValue = Cash;
end