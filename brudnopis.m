subplot(1,2,1)
dt=1/fs;
T=length(data)/fs;
t=0:dt:T;
t=t(1:length(data));
plot(t,data);
subplot(1,2,2)
spectrogram(data,[],[],[],fs)

