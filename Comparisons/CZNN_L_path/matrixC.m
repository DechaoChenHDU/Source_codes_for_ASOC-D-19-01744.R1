function res=matrixC(t)%matrix C(t) in linear inequation constrant g(x)=C(t)x(t)+d(t)<=0=g(x)

%%%%%%%%%%%%%%%%%%%%%%%%for time varying
 syms tt;
 
 %re=[1,1]+[0*tt,0*tt]; %%x1+x2
 
 re=[eye(8);-eye(8)]+[eye(8);-eye(8)]*tt*0; %%time varying %%上下极限
 
 tt=t;
%
%%%%%%%%%%%%%%%%%%%%

res=eval(re);
