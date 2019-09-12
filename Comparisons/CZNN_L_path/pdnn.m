function uDot=pdnn(t,y)

global tM tq rMin rPlu n1 m eed;

for i=1:(n1+eed+m),
    u(i,1)=y(i);
end;

mu=1e5;

newW=u-(tM*u+tq);
uDot=gfunction(rMin,newW,rPlu)-u;
uDot=mu*(eye(n1+eed+m,n1+eed+m)+tM')*uDot;