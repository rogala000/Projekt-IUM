function [Xfilt,t] = filtering_passband(x,Fs, t, T, passband, stopband)

df=1/T;

amp = fft(x);
amp = abs(amp);

filtr = zeros(1,length(amp));
filtr( stopband / df : passband / df)=1;
filtr(length(filtr) - passband / df : length(filtr) - stopband ) = 1;

Xfilt=real(ifft(fft(x).*filtr)); % *2;
