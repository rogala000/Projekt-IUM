function x = wingauss(L)
a=-(L-1)/2;
b=(L-1)/2;
n=a:b;
alfa = 2.5;
fi =  (L - 1)/(2*alfa);
x = exp((-n.^2)/(2*fi.^2));
end