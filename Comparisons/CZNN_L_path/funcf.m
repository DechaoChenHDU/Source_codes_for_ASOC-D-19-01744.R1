function res=funcf(x,t)%objective function f(x,t)

syms x1 x2 x3 x4 x5 x6 x7 x8 tt

myx=[x1;x2;x3;x4;x5;x6;x7;x8];

%ff=(cos(0.1*tt)+2)*x1^2+(cos(0.1*tt)+2)*x2^2+2*sin(tt)*x1*x2+sin(tt)*x1+cos(tt)*x2;
%%%Time-varying 01 LJ

%ff=(sin(tt)/8+1/2)*x1^2+(cos(tt)/8+1/2)*x2^2+cos(tt)*x1*x2/2+sin(3*tt)*x1+cos(3*tt)*x2;

WWW=eye(8,8);

myff=myx'*WWW*myx;

ff=norm(myff)+0*tt; %%MVN

%%%Time-varying 02 LWB

%ff=(x1-2*x2+2)^2;
x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
x5 = x(5);
x6 = x(6);
x7 = x(7);
x8 = x(8);
tt=t;

res = eval(ff);