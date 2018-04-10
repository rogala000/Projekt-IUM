function [] = rysuj(signal,t,fs,T,view, hObject, eventdata, handles);

if strcmp(view,'radiobutton_tv')
    handles.axes1
    plot(t,signal)
    title('Time view')
    xlabel('Time [s]')
    ylabel('Amplitude [ ]')
elseif strcmp(view,'radiobutton_psd')
    handles.axes1
     window = hann(2*fs);
     [amp,f]=pwelch(signal,window,[],[],fs)
    plot(f,amp)
    title('PSD')
    xlabel('Frequency [Hz]')
    ylabel('Amplitude [ ]')
    elseif strcmp(view,'radiobutton_fft')
    [amp,f,phase] = transformata_fft(signal,fs,T);
    handles.axes1
    plot(f,amp)
    title('FFT')
    xlabel('Frequency [Hz]')
    ylabel('Amplitude [ ]')
elseif strcmp(view,'radiobutton_spectrogram')
    handles.axes1
    spectrogram(signal,[],[],[],fs)
    title('Spectrogram')
    
end
end