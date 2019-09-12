function res=vectord(t)%vector d(t) in linear inequation constrant g(x)=C(t)x(t)+d(t)<=0

%%%%%%%%%%%%%%%%%%%%%% for time varying
syms tt;
%re=-[5]+[0*tt]; %%constant

%re=-[1,1,1,1]'+[0.8,0.8,-0.8,-0.8]'*tt*0; % 01 LJ

re=-[40*ones(2,1);70*ones(6,1);40*ones(2,1);70*ones(6,1)]+ones(16,1)*tt*0; %02 LWB

tt=t;
%%%%%%%%%%%%%%%%%

res=eval(re);