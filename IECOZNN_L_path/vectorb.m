function res=vectorb(t)%vector b(t) in linear equation constrant A(t)x(t)-b(t)
syms tt;

%re=-[cos(tt)]; %%%b=cos(t) time varying 01 LJ

re=-[cos(2*tt)]; %%%b=cos(t) time varying 02  LWB

%re=-[1.02+1.5]+[0*cos(tt)];

%re=[0*cos(tt)];
tt=t;
res=eval(re);