%% Script_0_ReadCambioData.m
% Author: Elia Matsumoto (EESP-SP) 
% 
% Contact: elia.matsumoto@fgv.br
% 
% Date: 2021
%% Reset

close all
clear
clc
%% Leitura do arquivo
% Nome do arquivo
Arquivo = 'ipeadata_cambio_full';
% Dado numerico: Cambio
CAMBIO = xlsread(Arquivo,'Serie');
% Dado alfanumerico: Datas
[~,DATES] = xlsread(Arquivo,'Dates');
% Exibição dos dados: Valor do Câmbio
Plot_Cambio(CAMBIO,DATES, ...
    'Valor do Câmbio: US$/R$ (Comercial/Venda/Média)',0);
%% Interpolação dos dados por PCHIP: Piecewise Cubic Hermite Interpolating Polynomial
Cambio = pchip_interp(CAMBIO);
Plot_Cambio(Cambio,DATES, ...
    'Média diária (US$/R$)',0)
%% Teste ADF: Dickey-Fuller (H0: tem raiz unitária)
[H,PValue,TestStat,CriticalValue] = adftest(Cambio(1:12))
if H
    disp('Série não estacionária => trabalhar com a primeira diferença');
else
    disp('Série estacionária => trabalhar com a série em nível');
end
%% Trabalhar com a 1a diferença (taxa):
cambio = diff(Cambio);
lcambio = diff(log(Cambio));
lcambio = lcambio - mean(lcambio);

%% Amostra dos dados
figure
subplot(2,2,1)
NS = 500;
plot(Cambio(1:NS));
title('Amostra da Série em nível')
subplot(2,2,3)
autocorr(Cambio);
subplot(2,2,2)
plot(cambio(1:NS));
title('Amostra da primeira diferença')
subplot(2,2,4)
autocorr(cambio);
%% Gráfico
Plot_Cambio(cambio,DATES, ...
    'Média diária (US$/R$) - Variação',1)
%% Salva dados
save CambioUSD_Data cambio lcambio