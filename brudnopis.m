clear all
close all
clc

% Wejœcia do funkcji
Fs=1000;
T=1;
stopband = 100;
passband = 150;
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
filtr( stopband / df : passband / df)=1;
filtr(length(filtr) - passband / df : length(filtr) - stopband ) = 1;

%yyaxis right
%hold on
%plot(f,filtr,'r')
%plot(f,amp(1:N/2+1))
% xlabel('Czestotliwosc [Hz]')
% ylabel('Amplituda [ ]')
[hAx,hLine1,hLine2] = plotyy(f,amp,f,filtr)
% set(hLine2,'Color','r')
Xfilt=real(ifft(fft(x).*filtr));
% figure
% subplot(2,1,1)
% plot(t,Xfilt)

% xlabel('Czas [s]')
% ylabel('Amplituda [ ]')
% [amp,f] = transformata_fft2(Xfilt,Fs,T);
% subplot(2,1,2)
% plot(f,amp)
% xlabel('Czestotliwosc [Hz]')
% ylabel('Amplituda [ ]')
% 

%Wyjœcia
t;
Xfilt;