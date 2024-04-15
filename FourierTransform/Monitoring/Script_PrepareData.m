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

%% Interpolação dos dados por PCHIP: Piecewise Cubic Hermite Interpolating Polynomial
Cambio = pchip_interp(CAMBIO);

%% Trabalhar com a 1a diferença (taxa):
cambio = diff(Cambio);
lcambio = diff(log(Cambio));
lcambio = lcambio - mean(lcambio);
ncambio = length(cambio);

%% Working Dataset L = 30
NW     = 30;
NOBS   = ncambio - NW;
YTotal = cambio(NW+1:NOBS);
NTotal = length(YTotal);
XTotal = zeros(NTotal,NW);
for inic = 1:NTotal
    final = inic+NW-1;
    XTotal(inic,:) = cambio(inic:final);
end

%% Save
save('CambioUSD_Data','cambio','lcambio','XTotal','YTotal');