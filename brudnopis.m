clear all,clc
fs=1e3,;%czestotliwoœæ próbkowania
T_of_S=1; %czas trwania w sekundach
t=0:1/fs:T_of_S;%wektor czasu
x=chirp(t,20,T_of_S,200);%analizowany_sygna³
%lw=0.1;%dlugosc okna w sek
lw=0.25
lw_samp=lw*fs;%dlugosc okna w probkach
%nakladowanie=50;
nakladowanie=0;% podane w %
noverlap=floor(nakladowanie/100*lw_samp); %liczba probek podlegajacych nakladkowaniu
nfft=2^nextpow2(lw_samp);
temp=0;i=1;
range=lw_samp; j=range;
s_left=length(x);
max=length(x);
row=1;S=0;
while s_left>=range
sig_temp=x(i:j-1);
s_left=length(x(j:max));
i=j-noverlap;
j=i+range;
whan=hanning(length(sig_temp));
fft_temp=fft(sig_temp'.*whan,nfft);
NS = length(fft_temp);
S=S./length(sig_temp);
S2plot = abs(fft_temp);
df= fs/NS;
fv= 0:df:(fs-df);
S2plotSS = S2plot(1:NS/2+1);
S2plotSS(2:end) = 2* S2plotSS(2:end);
fvSS=fv(1:NS/2+1);
ztemp=S2plotSS;
XX(:,row)=S2plotSS;
for k=1:lw_samp+noverlap+1
A(:,(row-1)*(lw_samp-noverlap)+k)=ztemp;
end
row=row+1;
end
A=A'
[F,T]=meshgrid(0:df:fs/2,1/fs:1/fs:length(x)/fs);
title('Tw=0.25s overlap=0%')
h=surface(F,T,A);
set(h,'EdgeColor','none')
axis('tight');
axis([fvSS(1) fvSS(end) 0 length(x)/fs]);
xlabel('Hz'),ylabel('czas');
whan=hanning(length(x));