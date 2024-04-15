%% Script_USDRL_WAV
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
load CambioUSD_Data;

%% Initialization
fs    = 1;
nobs  = length(lcambio);
wsize = 30;
nwin  = fix(nobs/wsize);

%% Windows
for i = 1:nwin
    %% Plot
    subplot(2,1,1)
    title('Variação do câmbio BRL/USD');
    wi = (i-1)*wsize + 1;
    wf = min(wi + wsize - 1,nobs);
    xwi = [wi wi];
    xwf = [wf wf];
    yw  = [-0.05 0.1];
    plot(1:nobs,lcambio,'b',xwi,yw,'r:',xwf,yw,'r:');
    subplot(2,1,2)
    wcambio = lcambio(wi:wf);
    tquad   = 1:wsize;
    [cfs,f] = cwt(wcambio,'bump',fs);
    helperCWTTimeFreqPlot(cfs,tquad,f,'surf','CWT of Quadratic Chirp','Seconds','Hz');
    colormap(pink(100));
    pause(3); disp(i); % input('next>>>');
end
