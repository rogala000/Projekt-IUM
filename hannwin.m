function x = hannwin(L)
 n=0:L;
 x=0.5*(1 - cos(2*pi*(n/L)));
end