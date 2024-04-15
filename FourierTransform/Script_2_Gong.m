%% Script_Gong
%
% Author: Elia Matsumoto
% 
% Contact: elia.matsumoto@fgv.br
% 
% Date: 2021
%
%% Reseting environment
rng('shuffle'); % Random seed
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window

%% Load data
load gong.mat;  % y FS
L  = length(y); % Length of the signal
F  = Fs;        % Frequency of the signal
t  = (0:(L-1))';

%% Original Sound
sound(y,Fs);
plot(t,y);

%% Fast-fourier transform
Y = fft(y);
Pyy = Y.*conj(Y);    % Amplitude
f = (L/F)*(0:(L-1)); % Frequencies

%% Plot Original data
figure
subplot(1,2,1)
plot(t,y)
xlabel('Time')
ylabel('Load')
title('Data')
subplot(1,2,2)
plot(f(1:L*0.5),Pyy(1:L*0.5))
title('Power spectral density')
xlabel('Frequency (Hz)')
ylabel('Amplitude|P(f)|')

%% Noisy data
NF = 3;
yn = y + cos(NF*t);
plot(t(1:100),cos(NF*t(1:100)))
plot(t,yn)
%% Noisy Sound
sound(yn,Fs);

%% Fast-fourier transform
Yn = fft(yn);
Pyyn = Yn.*conj(Yn);

%% Plot Noisy data
figure
subplot(1,2,1)
plot(t,yn)
xlabel('Time')
ylabel('Noisy Load')
title('Data')
subplot(1,2,2)
stem(f(1:L*0.5),Pyyn(1:L*0.5))
title('Noisy Power spectral density')
xlabel('Frequency (Hz)')
ylabel('Amplitude|P(f)|')

%% Filtering frenquencies
YF = Yn;
Threshold = 10e5;
Ind = find(Pyyn > Threshold); % 
YF((Ind(1)-Fs*0.5):(Ind(end)+Fs*0.5)) = 0;                 % Delete
Pyyf = YF.*conj(YF);
f = (L/F)*(0:(L-1));
figure
stem(f(1:L*0.5),Pyyf(1:L*0.5))
title('Filtered Power spectral density')
xlabel('Frequency (Hz)')
ylabel('Amplitude|P(f)|')

%% Inverse fft
yf = ifft(YF);

%% Plot
figure
plot([y yf]);
legend('Original','Filtered')
title('Time domain signal')

%% Sound
sound(yf,Fs)


