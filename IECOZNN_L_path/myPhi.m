function res=myPhi(x,r,lm,t)   %%%%%%%%%%%contrust (-Cx-d-lamuda)^+

%syms x1 x2 r1 lm1 tt;

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
x5 = x(5);
x6 = x(6);
x7 = x(7);
x8 = x(8);
r1 = r(1);
r2 = r(2);
r3 = r(3);
lm1 = lm;

 tt = t; 
% 
 xx=[x1 x2 x3 x4 x5 x6 x7 x8];
% rr=[r1];
 lamuda=[lm1];

ggx=matrixC(tt)*xx'+vectord(tt)+lamuda;



myphi=zeros(length(ggx),1);



%%%%%%%%%%%%%%%%%%%%%%method 01
for i=1:length(ggx),
    if (ggx(i)<=0) myphi(i)=0;
    end;
    if (ggx(i)>0) myphi(i)=1;
    end;
end

%%%%%%%%%%%%%%%%%%%method 02
% myka=1000;
% for i=1:length(ggx),
%     if (ggx(i)<=0) myphi(i)=0;
%     end;
%     if (ggx(i)>0) && (ggx(i)<(1/myka)) myphi(i)=myka*ggx(i);
%     end;
%     if (ggx(i)>(1/myka)) myphi(i)=1;
%     end;
% end


re=diag(myphi); %%\Phi

res = re;

