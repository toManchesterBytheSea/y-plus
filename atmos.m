function[Temp,sonic,pres,rho,dyna_vis] = atmos(altitude)

%almosphere at altitude

[Temp,sonic,pres,rho] = atmosisa(altitude*1000);
%dynamic viscos base surtherland law
Tref = 273.15;
dyna_visref = 1.716e-5;
S = 110.4;

dyna_vis = dyna_visref*(Temp/Tref)^(3/2)*(Tref+S)/(Temp+S);


end