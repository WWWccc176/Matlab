%MAIII_4A
%
f0='%8.0f %12.8f %12.8f\n';
f1='inf %12.8f %12.8f\n';
disp(' n Ic Is')
Icexact=1.80904848; Isexact=.62053660;
for n=100:100:1000
h=1/n; k=(1:n-1)'; x=k*h;
Ic=h*(sum(cos(x)./sqrt(x))+cos(1)/2);
Is=h*(sum(sin(x)./sqrt(x))+sin(1)/2);
fprintf(f0,n,Ic,Is)
end
fprintf('\n')
fprintf(f1,Icexact,Isexact)