%% callback_Stop
%
% Author: Elia Matsumoto
% 
% Contact: elia.matsumoto@fgv.br
% 
% Date: 2018
%
% function callback_Display ()
%
function callback_Stop()
%% Set Keep_running off
hf = gcf;
hobj = findobj(hf,'Tag','START');
set(hobj,'UserData',false);

