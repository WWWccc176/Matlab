function [y] = ttl6funq3(x)
if x>=90
    y = 'Your letter grade is A.';
elseif x>=80&&x<89
    y = 'Your letter grade is B.';
elseif x>=70&&x<79
    y = 'Your letter grade is C.';
elseif x>=60&&x<69
    y = 'Your letter grade is D.';
else 
    y = 'Your letter grade is E.';
end