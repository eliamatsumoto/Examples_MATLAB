% reset_price :
function reset_price ( )
% Reset values 
hf     = gcf;
obj    = findobj(hf,'Tag','COMPET');
set(obj,'Value',0.5);
obj    = findobj(hf,'Tag','ELASTI');   
set(obj,'Value',0.5);
ha1 = findobj(hf,'Tag','EIXO1');  
axes(ha1);
cla;
ha2 = findobj(hf,'Tag','EIXO2');    
axes(ha2);
cla;
