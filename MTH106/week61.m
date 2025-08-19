x=[9 6 8];
if x>5
    y=x;
elseif (x>0) & (x<=5)
        y=2.*x;
else
    y=3.*x;
end
disp(y)
%这里是指每一个元素都要满足条件才会运行相应相应的语句，否则就是else
