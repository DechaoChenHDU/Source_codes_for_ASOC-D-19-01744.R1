% function gf=gfunction(rm,u,rp)
% for i=1:length(u),
%     if (u(i)>=rp(i)) 
%         gf(i,1)=rp(i);
%     elseif (u(i)<=rm(i)) 
%         gf(i,1)=rm(i);
%     else 
%         gf(i,1)=u(i);
%     end;
% end;

function gf=gfunction(u)
global yp ym;
for i=1:length(u),
    if (u(i)>yp(i)) 
        gf(i,1)=yp(i);
    elseif (u(i)<ym(i)) 
        gf(i,1)=ym(i);
    else 
        gf(i,1)=u(i);
    end;
end;



