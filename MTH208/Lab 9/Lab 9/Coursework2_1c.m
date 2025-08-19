%MAIII_4C
%
f0='%8.0f %12.8f %12.8f\n';
f1=' inf %12.8f %12.8f\n';
disp(' n Ic Is')
Icexact=1.80904848; Isexact=.62053660;
for n=20:20:200
h=1/n; k=(1:n-1)'; x=k*h;
Ic=2*h*(1/2+sum(cos(x.^2))+cos(1)/2);
Is=2*h*(sum(sin(x.^2))+sin(1)/2);
fprintf(f0,n,Ic,Is)
end
fprintf('\n')
fprintf(f1,Icexact,Isexact)