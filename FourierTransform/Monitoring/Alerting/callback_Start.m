%% callback_Start
%
% Author: Elia Matsumoto
%
% Contact: elia.matsumoto@fgv.br
%
% Date: 2018
%
% function callback_Display ()
%
function callback_Start()

%% Initialization
Threshold    = 0.025;
Keep_running = true;
Val_Window   = 30;
Val_Horizon  = 5;

%% Figure
hf = gcf;

%% Get data: Info
hobj     = findobj(hf,'Tag','LOADDATA');
Info     = get(hobj,'UserData');
cambio   = Info.Data;
status   = Info.Status;
forecast = Info.Forecast;

%% Get Initial Day
hobj        = findobj(hf,'Tag','VINITIAL');
Val_Initial = str2double(get(hobj,'String'));

%% Set Keep_running on
hobj = findobj(hf,'Tag','START');
set(hobj,'UserData',Keep_running);

%% Keep running
ncambio = length(cambio);
while Keep_running && (Val_Initial+Val_Window+Val_Horizon) < ncambio 
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
    tb = [IH FH];
    ub = [ Threshold  Threshold];
    lb = [-Threshold -Threshold];
    
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
    set(ha,'YLim',[-0.2 0.2]);
    set(ha,'FontSize',14);
    xlabel('Days');
    ylabel('Currency variation');
    title('Current Window');
    
    %% Horizon Axes data
    ha = findobj(hf,'Tag','HORIZON');
    axes(ha);
    if isempty(thi)
        hp=plot(th,yh,tb,ub,'r:',tb,lb,'r:');
        set(hp(2),'LineWidth',2);
        set(hp(3),'LineWidth',2);        
    else
        hp = plot(th,yh,tb,ub,'r:',tb,lb,'r:',thi,yhi,'r*');
        set(hp(2),'LineWidth',2);
        set(hp(3),'LineWidth',2);            
        set(hp(4),'MarkerSize',8);
    end
    grid('on');
    set(ha,'YLim',[-0.2 0.2]);
    set(ha,'XTick',th);
    set(ha,'FontSize',14);
    xlabel('Days');
    title('Future Horizon');
    
    %% SPECTRO Axes data
    ha = findobj(hf,'Tag','SPECTRO');
    axes(ha);
    cf = freq(1:fix(L*0.5))';
    cp = Pyy(1:fix(L*0.5));
    % stem(cf,cp,'.');
    stem(cf,cp);
    plot(cf,cp);
    grid('on');
    set(ha,'FontSize',14);
    xlabel('Frequency');
    ylabel('|P|');
    title('Current Window Spectrogram');
    
    %% Set FORECAST
    hobj   = findobj(hf,'Tag','FORECAST');
    if forecast(Val_Initial)
        set(hobj,'String','ON');
        hobj = findobj(hf,'Tag','HORIZON');
        set(hobj,'Color',[1 1 0.7]);
    else
        set(hobj,'String','off');
        hobj = findobj(hf,'Tag','HORIZON');
        set(hobj,'Color',[1 1 1]);
    end
    
    %% Set STATUS
    hobj   = findobj(hf,'Tag','STATUS');
    if forecast(Val_Initial) == status(Val_Initial)
        set(hobj,'String','RIGHT');
        set(hobj,'ForegroundColor',[0 1 0]);
    else
        set(hobj,'String','WRONG');
        set(hobj,'ForegroundColor',[1 0 0]);
    end
    
    %% Increment initial day
    Val_Initial = Val_Initial+1;
    
    %% Wait interruption
    pause(0.1);
    
    %% Get Keep_running
    hobj         = findobj(hf,'Tag','START');
    Keep_running = get(hobj,'UserData');
end
