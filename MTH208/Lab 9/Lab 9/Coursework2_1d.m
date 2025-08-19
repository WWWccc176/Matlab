%MAIII_4D
%
f0='%8.0f %20.15f %20.15f\n';
f1='inf %20.15f %20.15f\n';
disp(' n Ic Is')
Icexact=1.809048475800544; Isexact=0.620536603446762;
n=10;
ab=r_jacobi01(n);
for k=1:n
xw=gauss(k,ab);
Ic=2*sum(xw(:,2).*cos(xw(:,1).^2));
Is=2*sum(xw(:,2).*sin(xw(:,1).^2));
fprintf(f0,k,Ic,Is)
end