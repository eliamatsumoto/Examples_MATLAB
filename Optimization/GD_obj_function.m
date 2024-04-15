% ezsurf('(x^2+y^2)+sin(5*x)+cos(3*y)',[-2 2],[-2 2])
function z = GD_obj_function(x,y)
z = (x.^2+y.^2)+sin(5*x)+cos(3*y);