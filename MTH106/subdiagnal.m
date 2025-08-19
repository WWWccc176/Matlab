A = rand(10);
A = 10*A;
b = zeros(10);
c = eye(9);
b(2:10,1:9) = c;
d = logical(b);
A(d)