function [amp,f] = transformata_fft2(x,fs,T)
clear amp;
clear f;
df= 1/T;
f=0:df:fs/2;
N = size(x);
N = max(N);
amp = fft(x);
amp = abs(amp);
amp = amp(1:N/2+1);
if(length(amp)>length(f))
amp = amp(1:N/2);
end
amp = amp/(N/2);
end