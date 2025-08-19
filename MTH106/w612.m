x=-5:0.1:30;
f=zeros(size(x));
for k=1:length(x)
    if x(k)>=9
        f(k)=15*sqrt(4*x(k))+10;
    elseif (x(k)>=0)&(x(k)<9)
        f(k)=10*x(k)+10;
    else
        f(k)=10;
    end
end
plot(x,f)