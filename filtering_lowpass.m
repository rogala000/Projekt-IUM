function [Xfilt,t] = filtering_lowpass(x,Fs, t, T, stopband)

% dt=1/Fs;
df=1/T;


% f=0:df:Fs/2;
% N = size(x);
% N = max(N);
amp = fft(x);
amp = abs(amp);


% % % % % %amp = amp/(N/2);


% subplot(2,2,[1,2])
% plot(t,x)
% xlabel('Czas [s]')
% ylabel('Amplituda [ ]')
% % % % % % % %[amp,f] = transformata_fft(x,Fs,T);
% subplot(2,2,[3,4])
% f=0:df:Fs;
% % % % % % % % % % %yyaxis left
% % % % % % % % % % %plot(f,amp)
filtr = zeros(1,length(amp));
% piki = find(amp>100);
filtr( 1: stopband / df)=1;
filtr(length(filtr) - stopband / df : length(filtr)) = 1;
%yyaxis right
%hold on
%plot(f,filtr,'r')
%plot(f,amp(1:N/2+1))
% xlabel('Czestotliwosc [Hz]')
% ylabel('Amplituda [ ]')
% [hAx,hLine1,hLine2] = plotyy(f,amp,f,filtr)
% set(hLine2,'Color','r')
Xfilt=real(ifft(fft(x).*filtr)); %*2;
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

%Wyj�cia



