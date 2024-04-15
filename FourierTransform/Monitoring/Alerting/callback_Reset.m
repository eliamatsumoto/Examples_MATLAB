%% callback_Reset
%
% Author: Elia Matsumoto
% 
% Contact: elia.matsumoto@fgv.br
% 
% Date: 2018
%
% function callback_Display ()
%
function callback_Reset()

%% Figure
hf = gcf;
ha = findobj(hf,'Tag','SPECTRO');
cla(ha);
