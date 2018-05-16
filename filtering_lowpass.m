function [Xfilt,t] = filtering_lowpass(x,Fs, t, T, stopband, type)
df=1/T;
amp = fft(x);
amp = abs(amp);

if strcmp(type, 'radiobutton_window_rectangle')

filtr = zeros(1,length(amp));
filtr( 1: stopband / df)=1;
filtr(length(filtr) - stopband / df : length(filtr)) = 1;

elseif strcmp(type, 'radiobutton_window_hann')
filtr = ones(1,length(amp));

window = hannwin(length(filtr)/20);
filtr(stopband /df : stopband /df + length(window)-1) =1- window;

filtr(length(filtr) - stopband /df - length(window) : length(filtr) - stopband/df -1) = 1-window;
filtr(stopband/df + length(window)/2 :  length(filtr) - stopband/df - length(window)/2) = 0;

elseif strcmp(type, 'radiobutton_window_gauss')
filtr = ones(1,length(amp));

window = wingauss(length(filtr)/20);
filtr(stopband /df : stopband /df + length(window)-1) =1- window;

filtr(length(filtr) - stopband /df - length(window) : length(filtr) - stopband/df -1) = 1-window;
filtr(stopband/df + length(window)/2 :  length(filtr) - stopband/df - length(window)/2) = 0;

end


Xfilt=real(ifft(fft(x).*filtr)); %*2;




