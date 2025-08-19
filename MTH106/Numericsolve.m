function [t,y] = Numericsolve(tmax,y0,h)
    t = 0:h:tmax;
    n = length(t);
    y = zeros(1,n);
    y(1) = y0;

    for i = 1:n-1
        k1 = h * fun(t(i),y(i));
        k2 = h * fun(t(i)+h/2,y(i)+k1/2);
        k3 = h * fun(t(i)+h,y(i)-k1+2*k2);
        y(i+1) = y(i) + (k1 + 4*k2 + k3) / 6;
    end
end

function dydt = fun(t,y)
    dydt = (t-y)*t/2;
end