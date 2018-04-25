function [X] = dft(x)
clear X;
    len = length(x);
    N = len;
    n=0:len-1;
    x=x;
    for k=0:len-1
        X(k+1) = x*exp(-1i*2*pi*k*n'/N);
    end

end