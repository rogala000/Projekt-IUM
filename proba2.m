clear all,clc,close all
fs=1000;
T=1;
t=0:1/fs:T;
x = sin(2*pi*50*t);
nfft=2^nextpow2(length(x))     
x=[x zeros(1,nfft-length(x))];
x = bitrevorder(x);
N = length(x);
level = nfft;
phase = cos(2*pi/N*[0:(N/2-1)])-j*sin(2*pi/N*[0:(N/2-1)]);
for a = 1:level
    L = 2^a;      
    phase_level = phase(1:N/L:(N/2));
    for k = 0:L:N-L   
        for n = 0:L/2-1
            first  = x(n+k+1);
            second = x(n + k + L/2 +1)*phase_level(n+1);
            x(n+k+1)       = first + second;
            x(n+k + L/2+1) = first - second;
        end
    end
end
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