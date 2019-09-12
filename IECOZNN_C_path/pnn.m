function dotx=pnn(t,x)
global n1 Ee Cc mu;
for i=1:n1,
   yy(i,1)=x(i);
end
termIne=pnnPlusFun(Ee*yy);
termE=Cc*yy;
term=Cc'*termE+Ee'*termIne+(yy'*yy-1)*yy;
dotx=-mu*term;