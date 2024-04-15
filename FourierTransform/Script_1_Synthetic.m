%% Script_SinCosin
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

%% Synthetic data
L = 100;          % Signal length
F = 100;          % Frequency of the sign
t = linspace(0,2*pi,L);
y = sin(2*t) + cos(5*t); 
plot(t,y)

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
stem(f(1:10),Pyy(1:10))
title('Power spectral density')
xlabel('Frequency (Hz)')
ylabel('Amplitude|P(f)|')
