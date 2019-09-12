function coneqn=ceyty(y)
global Cc Ee;
if numrows(y)==1,
    y=y';
end;
Cc*y
mymax(Ee*y)
y'*y-1
coneqn=[Cc*y;mymax(Ee*y);y'*y-1];

function oupt=mymax(inpt)
for i=1:numrows(inpt),
    if inpt(i)>=0,
        oupt(i,1)=inpt(i);
    else 
        oupt(i,1)=0;
    end;
end;