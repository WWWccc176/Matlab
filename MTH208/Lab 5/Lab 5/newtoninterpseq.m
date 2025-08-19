function yyseq = newtoninterpseq(x,a,xx)
n = numel(x)-1;
if n~=numel(a)-1
    error('newtoninterpseq: x and a are of different length!');
end
yyseq = zeros(numel(xx),n+1);
yyseq(:,1) = a(1);
q = ones(numel(xx),1);
xx = xx(:);
for k = 1:n
    q = q.*(xx-x(k));
    yyseq(:,k+1) = yyseq(:,k) + a(k+1)*q;
end