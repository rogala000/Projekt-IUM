function [amp,f,phase] = transformata_fft(x,fs,T)
df= 1/T;
f=0:df:fs/2;
N = size(x);
N = max(N);
amp = fft(x);
phase = angle(amp)*180/pi;
phase = phase(1,1:length(f));
amp = abs(amp);
amp = amp(1:N/2+1);
amp = amp/(N/2);
end