function x = hammwin(L)
N=L-1;
n=0:N;
x = 0.54 -( 0.46* cos(2*pi*(n/N)));
end