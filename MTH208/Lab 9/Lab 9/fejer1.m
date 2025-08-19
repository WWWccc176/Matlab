function I = fejer1(f,a,b,nsub,m)
%Fejer's first rule uses zeros of m-th Chebyshev polyn. on subintervals.
%See `Fast construction of the Fejer and Clenshaw-Curtis quadrature rules'.
%Apply Fejer's first rule on nsub subintervals of [a,b].

% nodes t and weight w on [-1,1]
t = cos((2*(1:m)-1)/2/m*pi);
N=(1:2:m-1)'; l = length(N); K=(0:m-1-l)';
v0=[2*exp(1i*pi*K/m)./(1-4*K.^2); zeros(l+1,1)];
v1=v0(1:end-1)+conj(v0(end:-1:2)); w=ifft(v1);

% map nodes to each subinterval
hsub = (b-a)/nsub;
xsub = linspace(a,b,nsub+1)';
x = (xsub(1:end-1)+xsub(2:end))/2*ones(size(t));
x = x + (xsub(2:end)-xsub(1:end-1))/2*t;

% sum all
I = sum(f(x)*w)*hsub/2;
