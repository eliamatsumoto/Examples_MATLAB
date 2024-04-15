% calc_price :
function calc_price ( )
% Get values from GUIDE
hf     = gcf;
obj    = findobj(hf,'Tag','COMPET');
compet = get(obj,'Value');
obj    = findobj(hf,'Tag','ELASTI');   
elasti = get(obj,'Value');
[t,y]=ode45('fprice',[0 50],[1;0],[], compet, elasti);
ha1 = findobj(hf,'Tag','EIXO1');  
axes(ha1);
h=plot(t,y(:,1));
axis(gca,[0 20 0.0 5.0]);
set(h(1),'linewidth',1);
title('Price', 'fontsize', 14);
ha2  = findobj(hf,'Tag','EIXO2');    
axes(ha2);
h=plot(t,y(:,2),'r');
set(h(1),'linewidth',1);
axis(gca,[0 20 -1.0 1.0]);
title('Price variation','fontsize', 14);
