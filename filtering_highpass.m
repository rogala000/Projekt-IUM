function [Xfilt,t] = filtering_highpass(x,Fs, t, T, passband)

df=1/T;

amp = fft(x);
amp = abs(amp);

filtr = ones(1,length(amp));
filtr( 1: passband / df)=0;
filtr(length(filtr) - passband / df : length(filtr)) = 0;

Xfilt=real(ifft(fft(x).*filtr)); % *2;
