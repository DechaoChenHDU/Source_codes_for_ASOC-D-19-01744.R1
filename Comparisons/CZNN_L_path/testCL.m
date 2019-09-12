x0=2;y0=2;
Ialpha=sqrt(x0^2+y0^2);
Ibeta=atan(y0/x0);
T=10;
t=0:0.01:T;
phi_sin=2*pi*sin(0.5*pi*t/T);
phi=phi_sin.*sin(0.5*pi*t/T);
x=Ialpha*cos(Ibeta+phi);
y=Ialpha*sin(Ibeta+phi);
plot(x,y); hold on;
plot(x0,y0,'*')