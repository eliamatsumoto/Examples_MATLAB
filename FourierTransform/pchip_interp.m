% Piecewise Cubic Hermite Interpolating Polynomial (PCHIP)
% pchip_interp(x)
% 
function yp = pchip_interp(y)
% Verifica tipo de dado
if iscell(y)
    yc = y;
    ny = length(y);
    y = NaN*ones(ny,1);
    for i=1:ny
        if isnumeric(yc{i})
            y(i) = yc{i};
        end
    end
end
n=length(y);
x=1:n;
yp = y;
% Separar dados validos/invalidos
indNan = find(isnan(y));
indNum = find(~isnan(y));
% Calcular Piecewise Cubic Hermite Interpolating Polynomial (PCHIP)
xNum=x(indNum);
yNum=y(indNum);
pc=pchip(xNum,yNum);
% Interpolar valores invalidos
xNan=x(indNan);
yNan=ppval(pc,xNan);
yp(indNan)=yNan;
% Geracao do grafico
figure
x1=linspace(min(xNum),max(xNum),4*n);
y1=ppval(pc,x1);
plot(x1,y1,xNum,yNum,':*',xNan,yNan,'ro')
legend('Pchip','Válidos','PCHIP')
