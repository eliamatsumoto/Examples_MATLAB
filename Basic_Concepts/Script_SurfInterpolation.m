%% Initialization
clear all
clc
inic = 0;
fin  = 1;
%% Points
N   = 5;
SIG = 0.5;
X = linspace(inic,fin,N);
Y = X;
[MX,MY] = meshgrid(X,Y);
MZ = normrnd(0,SIG,N,N);
n = 10*N;
x = linspace(inic,fin,n);
y = x;

%% Mesh CUBIC
method1 = "cubic";
[mx1,my1] = meshgrid(x,y);
mz1 = interp2(MX,MY,MZ,mx1,my1,method1);

%% Mesh SPLINE
method2 = "spline";
[mx2,my2] = meshgrid(x,y);
mz2 = interp2(MX,MY,MZ,mx2,my2,method2);


%% Plot
subplot(1,3,1);
plot3(MX,MY,MZ,"ko","LineWidth",2);
title("Points in 3D")
subplot(1,3,2);
plot3(MX,MY,MZ,"ko","LineWidth",2);
hold
surf(mx1,my1,mz1,"FaceAlpha",0.8);
title("Interpolation method: " + method1);
subplot(1,3,3);
plot3(MX,MY,MZ,"ko","LineWidth",2);
hold
surf(mx2,my2,mz2,"FaceAlpha",0.8);
title("Interpolation method: " + method2);