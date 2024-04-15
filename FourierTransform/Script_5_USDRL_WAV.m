%% Script_USDRL_WAV
%
% Author: Elia Matsumoto
% 
% Contact: elia.matsumoto@fgv.br
% 
% Date: 2023
%
%% Reseting environment
rng('shuffle'); % Random seed
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window
load CambioUSD_Data;
nobs = length(lcambio);
tquad = 1:nobs;
fs = 1;

%% Wavelet
NT = 26;
[cfs,f] = cwt(lcambio,'bump',fs);
one_wav = cfs(:,NT);
mod_wav = abs(one_wav).^2;
plot(mod_wav);
title(['Wavelet sNT = 1ample t(' num2str(NT) ')']); 
%% Plot
subplot(2,1,1)
plot(lcambio);
title('Variação do câmbio BRL/USD');
%% 
% Obtain a time-frequency plot of this signal using the CWT with a bump wavelet. 
% The bump wavelet is a good choice for the CWT when your signals are oscillatory 
% and you are more interested in time-frequency analysis than localization of 
% transients.
subplot2=subplot(2,1,2);
helperCWTTimeFreqPlot(cfs,tquad,f,'surf','CWT of Quadratic Chirp','Seconds','Hz');
colormap(pink(100));
view(subplot2,[4.29660000001813 65.8972973149927]);
