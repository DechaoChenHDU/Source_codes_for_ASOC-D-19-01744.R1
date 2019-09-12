function res=doth(x,r,lm,t,J,vectorb)%solve for partial derivative of h(y,t) with respect to t

syms tt;

% x1 = x(1);
% x2 = x(2);
% r1 = r(1);
% lm1=lm(1);
% tt=t;

% xx=[x1 x2];
rr=r;
% lamuda=[lm1];

ss=[vectorg(x,t)+J'*rr+matrixC(t)'*lm;-(J*x+vectorb);-mypositivefun(x,rr,lm,t)-matrixC(t)*x-vectord(t)];
s=diff(ss,tt);
tt=t;

res=eval(s);