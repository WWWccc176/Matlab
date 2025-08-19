Lh = 5; Kh = 3; % mesh size
L = -10:.5:10; K = -10:.5:10;
[LL,KK] = meshgrid(L,K);
P = 1.01.*(LL.^0.75).*(KK.^0.25)
surf(LL,KK)
[L,K] = gradient(P,Lh,Kh);%PL is for 𝜕P/𝜕P PK is for 𝜕P/𝜕K
[PL,PK,Z] = surfnorm(P);
% plot contour lines and gradient vector in the same figure
contour3(LL,KK,P);
hold on
quiver3(LL,KK,P,PL,PK,Z);% plot vectors as arrows with component 
% (PL(i,j),PK(i,j)) at (LL(i,j),KK(i,j))
hold off
    