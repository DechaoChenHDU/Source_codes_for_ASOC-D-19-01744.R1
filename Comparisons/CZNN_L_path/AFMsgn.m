function y=AFMsgn(x,p)
if nargin==1, p=1/5;
end
i=find(x>0);
y(i)=1/2*abs(x(i)).^p+1/2*abs(x(i)).^(1/p);

j=find(x<=0);
y(j)=-1/2*abs(x(j)).^p-1/2*abs(x(j)).^(1/p);
y=y';