% ezsurf('(x^2+y^2)+sin(5*x)+cos(3*y)',[-2 2],[-2 2])
function z = GA_obj_function(XY)
x = XY(:,1);
y = XY(:,2);
z = (x.^2+y.^2)+sin(5*x)+cos(3*y);
