%% Script_USDRL_FT
%
% Author: Elia Matsumoto
% 
% Contact: elia.matsumoto@fgv.br
% 
% Date: 2019
%
%% Reseting environment
rng('shuffle'); % Random seed
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window

%% Load data
load CambioUSD_Data.mat;  % cambio
y  = cambio;
L  = length(y); % Length of the signal
t  = 1:L;

%% Fast-fourier transform
Y = fft(y);
Pyy = Y.*conj(Y); % Amplitude
f = 0:(L-1);      % Frequencies

%% Plot Original data
subplot(1,2,1)
plot(t,y)
h = gca;
% set(h,'YLim',[-0.3 0.3]);
xlabel('Time')
ylabel('Currency variation')
title('Data Window')
subplot(1,2,2)
stem(f(1:fix(L*0.5)),Pyy(1:fix(L*0.5)))
title('Power spectral density')
xlabel('Frequency')
ylabel('Amplitude')
