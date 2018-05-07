function [Xfilt,t] = filtering_passband(x,Fs, t, T, passband, stopband, type)

df=1/T;

amp = fft(x);
amp = abs(amp);


if strcmp(type, 'radiobutton_window_rectangle')

filtr = zeros(1,length(amp));
filtr( stopband / df : passband / df)=1;
filtr(length(filtr) - passband / df : length(filtr) - stopband /df ) = 1;

elseif strcmp(type, 'radiobutton_window_hann')
    
filtr = zeros(1,length(amp));
filtr( stopband / df : passband / df)= hann(length( stopband / df : passband / df));
filtr(length(filtr) - passband / df : length(filtr) - stopband /df ) = hann(length( stopband / df : passband / df));

elseif strcmp(type, 'radiobutton_window_gauss')
filtr = zeros(1,length(amp));
filtr( stopband / df : passband / df)= gausswin(length( stopband / df : passband / df));
filtr(length(filtr) - passband / df : length(filtr) - stopband /df ) = gausswin(length( stopband / df : passband / df));

else
    disp ('Cos sie zepsulo')
end


Xfilt=real(ifft(fft(x).*filtr)); % *2;
