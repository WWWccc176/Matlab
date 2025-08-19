function [yy, w] = lagrange(x,y,xx)%这个代码性能较好，但是要注意舍入误差。可以适当改进。

n = numel(x) - 1;
i = 1:n+1;
yy = zeros(size(xx));

% if xx==x then return yy=y
isx = zeros(size(xx),'logical');
for j = 1:n+1
    isxj = (x(j)==xx);
    yy(isxj) = y(j);
    isx = any([isx(:) isxj(:)],2);
end
notx = ~isx;

% first compute w for the nodes x
w = zeros(n+1,1);
for k = 1:n+1
    w(k) = 1/prod(x(k)-x(i~=k)); 
end

% then evaluate p at xx
for k = 1:n+1
    yy(notx) = yy(notx) + y(k)*w(k)./(xx(notx)-x(k));
end
for j = 1:n+1
    yy(notx) = yy(notx).*(xx(notx)-x(j));
end
