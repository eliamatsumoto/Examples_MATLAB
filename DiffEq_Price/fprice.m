function yp = fprice(t, y, flag, compet, elasti)
% y(1)' = y(2)
% y(2)' = demand - compet * y(1) - elasti * y(2)
demand = 1;
yp     =  [ y(2) 
           demand - compet * y(1) - elasti * y(2)];

