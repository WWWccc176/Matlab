clear
a = [243 236 389 628 143 417 205 404 464 605 137 123 372 439 497 500 535 577 441 231 675 132 196 217 660 569 865 725 457 347];
x_f = min(a):50:max(a);
histogram(a,x_f)
title('absolute frequency')
xlabel('data')
ylabel('af')

figure,
b = [243 236 389 628 143 417 205 404 464 605 137 123 372 439 497 500 535 577 441 231 675 132 196 217 660 569 865 725 457 347]/sum(a);
histogram(b, x_f)
title('relative frequency')
xlabel('data')
ylabel('rf')