function y = filtering_passband(x)
%FILTERING_PASSBAND Filters input x and returns output y.

% MATLAB Code
% Generated by MATLAB(R) 8.5 and the Signal Processing Toolbox 7.0.
% Generated on: 19-Mar-2018 12:06:44

persistent Hd;

if isempty(Hd)
    
    Fstop1 = 20;   % First Stopband Frequency
    Fpass1 = 25;   % First Passband Frequency
    Fpass2 = 50;   % Second Passband Frequency
    Fstop2 = 55;   % Second Stopband Frequency
    Astop1 = 60;   % First Stopband Attenuation (dB)
    Apass  = 1;    % Passband Ripple (dB)
    Astop2 = 60;   % Second Stopband Attenuation (dB)
    Fs     = 500;  % Sampling Frequency
    
    h = fdesign.bandpass('fst1,fp1,fp2,fst2,ast1,ap,ast2', Fstop1, Fpass1, ...
        Fpass2, Fstop2, Astop1, Apass, Astop2, Fs);
    
    Hd = design(h, 'equiripple', ...
        'MinOrder', 'any');
    
    
    
    set(Hd,'PersistentMemory',true);
    
end

y = filter(Hd,x);

