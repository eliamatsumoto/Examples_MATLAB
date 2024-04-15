%% callback_Display
%
% Author: Elia Matsumoto
% 
% Contact: elia.matsumoto@fgv.br
% 
% Date: 2018
%
% function callback_Display ()
%
function callback_Display()

Threshold = 0.025;

%% Figure
hf = gcf;

%% Get data: cambio
hobj   = findobj(hf,'Tag','LOADDATA');
cambio = get(hobj,'UserData');

%% Get Horizon size
hobj        = findobj(hf,'Tag','VHORIZON');
Val_Horizon = str2double(get(hobj,'String'));

%% Get Windows size
hobj        = findobj(hf,'Tag','VWINDOW');
Val_Window  = str2double(get(hobj,'String'));

%% Get Initial day value
hobj        = findobj(hf,'Tag','VINITIAL');
Val_Initial = fix(get(hobj,'Value'));
% Update slider max value
MaxValue    = length(cambio) - (Val_Horizon+Val_Window);
set(hobj,'Max',MaxValue);
% Update day info
hobj = findobj(hf,'Tag','DAYINFO');
set(hobj,'String',num2str(Val_Initial));

%% Window data plot intervals 
IW = Val_Initial;
FW = Val_Initial+Val_Window-1;

%% Horizon data plot intervals 
IH = FW+1;
FH = IH+Val_Horizon-1;

%% WINDOW AXES DATA
tw = IW:FW;
yw = cambio(tw);

%% HORIZON AXES DATA
th  = IH:FH;
yh  = cambio(th);
thi = [];
ind = find(abs(yh)>Threshold);
if ~isempty(ind)
    thi = th(ind);
    yhi = yh(ind);
end
   
%% SPECTRO AXES DATA
L    = length(yw);   % Length of the signal
YW   = fft(yw);      % Fast-fourier transform
Pyy  = YW.*conj(YW); % Amplitude
freq = 0:(L-1);      % Frequencies

%% Plot Windows Axes data
ha = findobj(hf,'Tag','WINDOW');
axes(ha);
plot(tw,yw);
grid('on');
set(ha,'YLim',[-0.32 0.3]);
xlabel('Days');
ylabel('Currency variation');
title('Current Window');

%% Horizon Axes data
ha = findobj(hf,'Tag','HORIZON');
axes(ha);
if isempty(thi)
    plot(th,yh);
else
    hp = plot(th,yh,thi,yhi,'r*');
    set(hp(2),'MarkerSize',8);
end
grid('on');
set(ha,'YLim',[-0.32 0.3]);
set(ha,'XTick',th);
xlabel('Days');
title('Future Horizon');

%% SPECTRO Axes data
ha = findobj(hf,'Tag','SPECTRO');
axes(ha);
cf = freq(1:fix(L*0.5))';
cp = Pyy(1:fix(L*0.5));
stem(cf,cp);
plot(cf,cp);
grid('on');
xlabel('Frequency');
ylabel('Amplitude');
title('Current Window Spectrogram')
