clear all,clc,close all
fs=1000;
T=1;
t=0:1/fs:T;
x = sin(2*pi*50*t);
nfft=2^nextpow2(length(x))     
x=[x zeros(1,nfft-length(x))];  %zeropadding      
N = length(x);                                                              
%x=bitrevorder(x);    %odwrocenie bitów                                                      
LOP=log2(N);   %ilosc operacji                                                               
Roznica=1;   %ustawienie roznicy na domyslna wartosc aby braæ parzyste i nieparzyste próbki    
for ii=1:LOP;
    for iii=0:(2^ii):(N-1);
        for n=0:(Roznica-1);
            aa=n+iii+1;
            pow=(2^(LOP-ii))*n;
            w=exp((-1i)*(2*pi)*pow/N);
            a=x(aa)+x(aa+Roznica).*w;                                       
            b=x(aa)-x(aa+Roznica).*w;                                      
            x(aa)=a;                                                      
            x(aa+Roznica)=b;                                                
        end;
    end;
Roznica=2*Roznica;    %wziecie kolejnych probek                                                            
end;
y=x;
df=1/T;
f=0:df:fs/2;
N = size(x);
N = max(N);
amp = y;
amp = abs(amp);
amp = amp(1:N/2+1);
if(length(amp)>length(f))
amp = amp(1:N/2);
end
amp = amp/(N/2);

plot(f,amp(1:length(f)))