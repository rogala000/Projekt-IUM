function y = filtrowanie(x,fs)
%FILTROWANIE Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.5 and the DSP System Toolbox 9.0.
% Generated on: 19-Nov-2017 19:23:25

persistent Hd;

if isempty(Hd)
    
    Fstop = 5;      % Stopband Frequency
    Fpass = 6;      % Passband Frequency
    Astop = 60;     % Stopband Attenuation (dB)
    Apass = 1;      % Passband Ripple (dB)
    Fs    = fs;  % Sampling Frequency
    
    h = fdesign.highpass('fst,fp,ast,ap', Fstop, Fpass, Astop, Apass, Fs);
    
    Hd = design(h, 'kaiserwin');
   
    
    
    
    set(Hd,'PersistentMemory',true);
    
end

y = filter(Hd,x);

