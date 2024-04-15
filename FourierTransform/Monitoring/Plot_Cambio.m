function Plot_Cambio(CAMBIO,DATES,Titulo,Flag_Taxa)
figure;
% Exibe curva
plot(CAMBIO)
% Ajusta o tamanho dos eixos
pos = get(gca,'Position');
set(gca,'Position',[pos(1), .2, pos(3) .65])
% Título
ht = title(Titulo);
set(ht,'FontSize',16);
% Label vertical
ylabel('R$')
% Prepara Eixo X
if Flag_Taxa
    XTLabel = DATES(2:end,2);
else
    XTLabel = DATES(2:end,1);
end
nXT = length(XTLabel);
XT  = ones(1,nXT);
for i=2:nXT
    XT(i) = datenum(XTLabel{i},'dd/mmm/yyyy')-datenum(XTLabel{1},'dd/mmm/yyyy');
end
XL = [0 XT(nXT)+1];

set(gca,'XTick',XT,'XLim',XL);
% Ajusta limite dos eixos
ax = axis; % Limites atuaais
axis(axis); % Configura para ajust manual
Yl = ax(3:4); % Limites verticais (eixo Y)
% Posiciona os lables
XTLabel{end-1} = '';
t = text(XT,Yl(1)*ones(1,length(XT)),XTLabel);
set(t,'HorizontalAlignment','right','VerticalAlignment','top', ...
    'Rotation',45);
% Remove os 'labels defautsl
set(gca,'XTickLabel','')
% Ajusta limites dos textos.
for i = 1:length(t)
    ext(i,:) = get(t(i),'Extent');
end
% Determine o ponto mais 'baixo'. O Xlabel será posicionado
% de forma que os pontos superiores fiquem alinhados
LowYPoint = min(ext(:,2));
% Posiciona o Xlabel no ponto alinhado
XMidPoint = XL(1)+abs(diff(XL))/2;
tl = text(XMidPoint,LowYPoint,'Period', ...
    'VerticalAlignment','top', ...
    'HorizontalAlignment','center');