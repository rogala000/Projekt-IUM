function [Xfilt,t] = filtering_highpass(x,Fs, t, T, passband, type)

df=1/T;

amp = fft(x);
amp = abs(amp);

if strcmp(type, 'radiobutton_window_rectangle')
    filtr = ones(1,length(amp));
    filtr( 1: passband / df)=0;
    filtr(length(filtr) - passband / df : length(filtr)) = 0;

elseif strcmp(type, 'radiobutton_window_hann')
filtr = zeros(1,length(amp));
window = hann(length(filtr)/20);
filtr(passband /df : passband /df + length(window)-1) = window;

filtr(length(filtr) - passband /df - length(window) : length(filtr) - passband /df -1) = window;
filtr(passband /df + length(window)/2 :  length(filtr) - passband / df - length(window)/2) = 1;
elseif strcmp(type, 'radiobutton_window_gauss')

filtr = zeros(1,length(amp));
window = gausswin(length(filtr)/20);
filtr(passband /df : passband /df + length(window)-1) = window;

filtr(length(filtr) - passband /df - length(window) : length(filtr) - passband /df -1) = window;
filtr(passband /df + length(window)/2 :  length(filtr) - passband / df - length(window)/2) = 1;
end



Xfilt=real(ifft(fft(x).*filtr)); % *2;
