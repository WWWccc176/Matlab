function s = kahan_sum(n)
    s = 0;
    c = 0;  % 补偿变量
    for k = n:-1:1
        y = 1/k^2 - c;
        t = s + y;
        c = (t - s) - y;  % 计算丢失的精度
        s = t;
    end
end
