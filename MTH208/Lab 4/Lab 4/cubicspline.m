function [yy, b, c, d] = cubicspline(x,y,xx,type)%natural boundary condition cubicspline
% type: 1 for natural, 2 for de Boor, 3 for periodic
n = numel(x)-1;
dx = diff(x(:)); dy = diff(y(:)); slope = dy./dx;
left = [dx(1:end-1);0;0];
centre = [1;2*(dx(1:end-1)+dx(2:end));1];
right = [0;0;dx(2:end)];
A = spdiags([left centre right],-1:1,n+1,n+1);
rhs = [0;3*(slope(2:end)-slope(1:end-1));0];
if 1==type
    % already done
elseif 2==type
    A(1,1)=dx(2); A(1,2)=-(dx(1)+dx(2)); A(1,3)=dx(1);
    A(end,end)=dx(end-1); A(end,end-1)=-(x(end)-x(end-2)); 
    A(end,end-2)=dx(end);
elseif 3==type
    if abs(y(end)-y(1))>5e-16
        disp('cubicspline: WARNING: non-periodic y for type periodic');
    end
    A(1,1)=2*(dx(end)+dx(1)); A(1,2)=dx(1); A(1,end-1)=dx(end);
    rhs(1)=3*(slope(1)-slope(end));
    A(end,1)=-1;
end
c = A\rhs;
b = slope - dx/3.*(2*c(1:end-1)+c(2:end));
d = diff(c)./dx/3;
yy = zeros(size(xx));
for i=1:n
    sub = xx>=x(i) & xx<=x(i+1);
    fac = xx(sub)-x(i);
    yy(sub)=y(i)+(b(i)+(c(i)+d(i)*fac).*fac).*fac;
end
