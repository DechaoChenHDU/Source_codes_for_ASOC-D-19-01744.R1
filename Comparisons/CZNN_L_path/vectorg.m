function res=vectorg(x,t)%solve for vector g(x,t), i.e., the first order partial derivative of function f(x,t) with respect to x

syms x1 x2 ttsyms x1 x2 x3 x4 x5 x6 x7 x8 tt

xx=[x1;x2;x3;x4;x5;x6;x7;x8];

ff=funcf(xx,tt);

ff1= diff(ff,x1);
ff2= diff(ff,x2);
ff3= diff(ff,x3);
ff4= diff(ff,x4);
ff5= diff(ff,x5);
ff6= diff(ff,x6);
ff7= diff(ff,x7);
ff8= diff(ff,x8);
cs=[ff1;ff2;ff3;ff4;ff5;ff6;ff7;ff8];

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
x5 = x(5);
x6 = x(6);
x7 = x(7);
x8 = x(8);
tt=t;

res = eval(cs);
