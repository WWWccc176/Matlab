function a = logisfit(x,y,alpha,maxIt,gradtol)

a = [1; 1]; x= x(:); y = y(:);
for it = 1:maxIt
  p = 1./(1+exp(-(a(2)*x+a(1))));
  dl = [sum(y-p); sum((y-p).*x)];
  a = a + alpha*dl;
  if norm(dl,2)<gradtol
      break;
  end
end