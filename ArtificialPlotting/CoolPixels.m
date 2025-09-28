[X,Y]=meshgrid(0:1023);
P(:,:,1)=bitand(bitand(mod(X,Y),mod(Y,X)),255);
P(:,:,2)=bitand(bitxor(mod(X,Y),mod(Y,X)),255);
P(:,:,3)=bitand(bitor(mod(X,Y),mod(Y,X)),255);
imshow(uint8(P))