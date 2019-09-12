function [bestERR,bestY,successI]=dtlvipdnn_94LVI(total,errtol)

global n m W qq J dd xm xp;
%W=eye(n,n); % must be I; i.e., CMP movement

H=[W -J';J zeros(m,m)];
dd;
p=[qq;-dd];
global yp ym;
ym=[xm;-inf*ones(m,1)];
yp=[xp;inf*ones(m,1)];
II=eye(size(H));

global yy0; % y0=(rand(size(ym))-0.5)*10;
%h=1; eta=2*n^2; 
u=yy0; % [xStarMATLAB;(rand(2,1)-0.5)*10];
LVI_yy0=yy0;

for i=1:total
    successI=i;
    %%%%%%%%%%%%%%%%%%%%%%%%
    eu=u-gfunction((II-H)*u-p);%u=u, H=M, p=q
    normeu=norm(eu);
    if normeu<errtol
         break;
    end
    dxk=(II+H')*eu;
    rhou=normeu^2/(norm(dxk)^2);
    %u=gfunction(u-gamma*rhou*dxk);
    u=u-rhou*dxk;    
end
if successI==total,
    eu=u-gfunction((II-H)*u-p);
    normeu=norm(eu);
end

bestY=u;
bestERR=normeu;