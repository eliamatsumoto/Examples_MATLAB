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
Data=load('CambioUSD_Data.mat');

%% Get current object
hobj = gco;

%% Store 'cambio'
set(hobj,'UserData',Data.cambio);
L = length(Data.cambio);

%% Set INITIAL (Slide bar) parameters
hf          = gcf;
hobj        = findobj(hf,'Tag','VHORIZON');
Val_Horizon = str2double(get(hobj,'String'));
hobj        = findobj(hf,'Tag','VWINDOW');
Val_Window  = str2double(get(hobj,'String'));
MaxValue    = L - (Val_Horizon+Val_Window);
hobj        = findobj(hf,'Tag','VINITIAL');
set(hobj,'Max',MaxValue);
set(hobj,'SliderStep',[1/L 1/L]);

%% Display
callback_Display;

