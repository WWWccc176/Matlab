% Richardson extrapolation for numerical derivative

f = @sin; h = 2.^(-1:-1:-9); x = 1;
y = f(x); y1 = f(x+h); y2 = f(x+2*h); yn = f(x-h);

% 3-point forward differences
fpfw = (-3*y+4*y1-y2)/2./h;
[fpfwe, Qfw] = neville(h,fpfw,0);

% centered differences
fpc = (y1-yn)/2./h;
[fpce, Qc] = neville(h.^2,fpc,0);

format long; 
[fpfw(:) diag(Qfw) fpc(:) diag(Qc)]