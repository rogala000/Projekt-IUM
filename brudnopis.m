clear all
close all
clc

% Wejœcia do funkcji
Fs=1000;
T=1;
stopband = 100;
passband = 100;
f1=25;
f2=140;
f3=350;


dt=1/Fs;
t=0:dt:T;

df=1/T;
x= sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t);


f=0:df:Fs/2;
N = size(x);
N = max(N);
amp = fft(x);
amp = abs(amp);


% % % % % %amp = amp/(N/2);


% subplot(2,2,[1,2])
% plot(t,x)
% xlabel('Czas [s]')
% ylabel('Amplituda [ ]')
% % % % % % % %[amp,f] = transformata_fft(x,Fs,T);
% subplot(2,2,[3,4])
f=0:df:Fs;
% % % % % % % % % % %yyaxis left
% % % % % % % % % % %plot(f,amp)
% piki = find(amp>100);
filtr = zeros(1,length(amp));
window = hann(length(filtr)/20);
filtr(passband : passband + length(window)-1) = window;

filtr(length(filtr) - passband - length(window) : length(filtr) - passband-1) = window;
filtr(passband + length(window)/2 :  length(filtr) - passband - length(window)/2) = 1;


filtr2 = ones(1,length(filtr));

filtr2( stopband: length(filtr) - stopband) =1-  hann ( length(stopband: length(filtr) - stopband));

[hAx,hLine1,hLine2] = plotyy(f,amp,f,filtr)
Xfilt=real(ifft(fft(x).*filtr));
figure,

 plotyy(f,amp,f,filtr2)

t;
Xfilt;