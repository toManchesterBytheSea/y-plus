clc;clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%y+
altitude = 3;  %km

R=360;%Radius，mm
omega=3000;%rpm/min
velo =omega*2*pi/60*R/1000*0.75;  %m/s
ref_L = 0.08; %m
yplus = 1 ;%desired Y+ value;

[Temp,sonic,pres,rho,dyna_vis] = atmos(altitude);



Re = rho*velo*ref_L/dyna_vis;

if (Re<10e9)
    Cf = (2*log10(Re)-0.65)^(-2.3);
else
    warndlg('Re>10e9')
end

WallShearStress = Cf*0.5*rho*velo^2;
FricVelo = (WallShearStress/rho)^0.5;
walldis = yplus* dyna_vis/rho/FricVelo*1000  %第一层网格厚度mm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%y+ end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%prism
growthrate = 1.2;
prismnum = 33;
totalthick = walldis*(1-growthrate^prismnum)/(1-growthrate)
nearestprism = walldis*growthrate^prismnum

