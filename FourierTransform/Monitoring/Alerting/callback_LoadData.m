%% callback LoadData
%
% Author: Elia Matsumoto
% 
% Contact: elia.matsumoto@fgv.br
% 
% Date: 2018
%
% function callback_LoadData ()
%
function callback_LoadData()

%% Load data: cambio
Data   = load('CambioUSD_Data.mat');
cambio = Data.cambio;

%% Load model outcomes
Model  = load('MODEL_Outcome.mat');
Status  = Model.YWD;
StatusH = Model.YWDH;

%% Create structured data
Info = struct('Data',cambio,'Status',Status,'Forecast',StatusH); 

%% Get current object
hobj = gco;

%% Store 'cambio'
set(hobj,'UserData',Info);

