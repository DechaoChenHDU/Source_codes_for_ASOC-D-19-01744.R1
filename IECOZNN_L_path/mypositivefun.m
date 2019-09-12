function res=mypositivefun(x,r,lm,t) %%%%%%%%%%%contrust (-Cx-d-lamuda)^+

%syms x1 x2 r1 lm1 tt;

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
x5 = x(5);
x6 = x(6);
x7 = x(7);
x8 = x(8);
xx=[x1;x2;x3;x4;x5;x6;x7;x8];



tt = t; 

%xx=[x1 x2];
%rr=[r1];
lamuda=lm;

ggx=matrixC(tt)*xx+vectord(tt)+lamuda;

mypositivefun=zeros(length(ggx),1);

for i=1:length(ggx),
    if (ggx(i)<=0) mypositivefun(i)=0;
    end;
    if (ggx(i)>0) mypositivefun(i)=ggx(i);
    end;
end

re=mypositivefun; %%\Phi

res = re;

