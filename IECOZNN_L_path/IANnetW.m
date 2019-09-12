function doty=IANnetW(t,y)

global init b mm nn pp rr mmm nnn dphi phi d R q n m T r alpha Nalpha...
    qP qM qDp qDm beta q0 theta0 dq Pinfty Minfty gamma myInf...
    cclalpha taskstartangle;
global Talpha aa J R_noise C_noise gol;% neural network

global flag1 flag2 flag3 flag4 flag5 flag6 flag7 flag8 flag9;

n=8;
m=3;
y;
for i=1:6,
 theta(i,1)=y(i+5);%q为六维数据，是机械臂
end
for i=1:8,
 q(i,1)=y(i+3);%q为八维数据，是左右轮+机械臂
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%0402

for i=1:8,
   %u(i,1)=y(i+8);
   mydq(i,1)=y(i+11);
end

for i=1:3,
    myrr(i,1)=y(i+11+8);
end

for i=1:16,
    mylm(i,1)=y(i+11+3+8);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


phi=y(3);%the rotation angle
xc=y(1);%left and right wheels
yc=y(2);




% [Ppx,Ppy,Ppz]=position(init);
% 
% % Ppx(8)=Ppx(8)+0.1;
% % Ppy(8)=Ppy(8)+0.1;
% % Ppz(8)=Ppz(8);
% ix=Ppx(8);
% iy=Ppy(8);
% iz=Ppz(8);
%%%%%%%%%%%%%%%%%%%--Desired rt and ddrt-- %%%LSR path
[Ppx,Ppy,Ppz]=position(init);
ix=Ppx(8);
iy=Ppy(8);
iz=Ppz(8);
phi_sin=2*pi*sin(0.5*pi*t/T);
Tphi=phi_sin*sin(0.5*pi*t/T);
phiDot=phi_sin*pi*cos(0.5*pi*t/T)/T;
rx=rr*cos(2*Tphi+Talpha)+ix-rr*cos(Talpha);
ry=rr*sin(Tphi+Talpha)+iy-rr*sin(Talpha);
rz=iz;
drx=-2*rr*sin(2*Tphi+Talpha)*phiDot;
dry=rr*cos(Tphi+Talpha)*phiDot;
drz=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%C Path
%    phi_sin=2*pi*sin(0.5*pi*t/T);
%    phi_sinDot=pi*pi*cos(0.5*pi*t/T)/T;
%    cphi=phi_sin*sin(0.5*pi*t/T);
%    phiDot=phi_sin*pi*cos(0.5*pi*t/T)/T;
%  
%    rx=rr*cos(cphi)+ix-rr;
%    ry=rr*cos(alpha)*sin(cphi)+iy;
%    rz=rr*sin(alpha)*sin(cphi)+iz;
%    
%    drx=-rr*sin(cphi)*phiDot;
%    dry=rr*cos(cphi)*cos(alpha)*phiDot;
%    drz=rr*cos(cphi)*sin(alpha)*phiDot;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% W
% desired_p=aa*T*(T-T*sin(2*pi*T/T)/(2*pi))/(2*pi);
% ix1=0.5*desired_p+ix; iy1=-sqrt(3/4)*desired_p+iy;
% ix2=0.5*desired_p+ix1; iy2=sqrt(3/4)*desired_p+iy1;
% ix3=-0.5*desired_p+ix2; iy3=sqrt(3/4)*desired_p+iy2;
% % ix4=0.5*desired_p+ix3; iy4=sqrt(3/4)*desired_p+iy3;
% 
% if t<=T,
%     desired_v=aa*T*(1-cos(2*pi*t/T))/(2*pi);
%     drx=0.5*desired_v;
%     dry=-sqrt(3/4)*desired_v;
%     drz=0;
%     desired_p=aa*T*(t-T*sin(2*pi*t/T)/(2*pi))/(2*pi);
%     rx=0.5*desired_p+ix;
%     ry=-sqrt(3/4)*desired_p+iy;
%     rz=iz;
% elseif t<=2*T,
%     desired_v=aa*T*(1-cos(2*pi*(t-T)/T))/(2*pi);
%     drx=0.5*desired_v;
%     dry=sqrt(3/4)*desired_v;
%     drz=0;
%     desired_p=aa*T*((t-T)-T*sin(2*pi*(t-T)/T)/(2*pi))/(2*pi);
%     rx=0.5*desired_p+ix1;
%     ry=sqrt(3/4)*desired_p+iy1;
%     rz=iz;
% elseif t<=3*T,
%     desired_v=aa*T*(1-cos(2*pi*(t-2*T)/T))/(2*pi);
%     drx=-0.5*desired_v;
%     dry=sqrt(3/4)*desired_v;
%     drz=0;
%     desired_p=aa*T*((t-2*T)-T*sin(2*pi*(t-2*T)/T)/(2*pi))/(2*pi);
%     rx=-0.5*desired_p+ix2;
%     ry=sqrt(3/4)*desired_p+iy2;
%     rz=iz;
% elseif t<=4*T,
%     desired_v=aa*T*(1-cos(2*pi*(t-3*T)/T))/(2*pi);
%     drx=-0.5*desired_v;
%     dry=-sqrt(3/4)*desired_v;
%     drz=0;
%     desired_p=aa*T*((t-3*T)-T*sin(2*pi*(t-3*T)/T)/(2*pi))/(2*pi);
%     rx=-0.5*desired_p+ix3;
%     ry=-sqrt(3/4)*desired_p+iy3;
%     rz=iz;
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r_xl=[rx;ry;rz];%%%r
dr_xl=[drx;dry;drz];%%%dr
[Ppx,Ppy,Ppz]=position(y);   
f_xl=[Ppx(8);Ppy(8);Ppz(8);];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NETphi=phi;
J=Jacob(phi,theta);  

%zz=[q(1);q(2);zztheta];%左右轮+机臂drift
%gamma=100000;
gamma=1;
lamuda=0;

%%%%%%%%%%%%%%%%Noise
% Test_noise=[0.1*t,0.6*sin(2*t),0.1*exp(-t)]';%%constant noise
% 
% T1_noise=[t,t,t]';%%Time varing noise（linear）
% 
% T_noise=[sin(3*t),0.5*sin(2*t),0.8*sin(t)]';%%Time varing noise（sin）
% 
% T2_noise=[exp(-2*t),0.8*exp(-5*t),0.3*exp(-t)]';%%Time varing noise（arbitrary example）

%qDot=pinv(J)*(dr_xl+gamma*(r_xl-f_xl));% Li activation function% CZNN

%qDot=pinv(J)*(dr_xl+(gamma*exp(t))*(r_xl-f_xl)+lamuda*t*(r_xl-f_xl));%%近似逼近积分方法 IEZNN

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%20190402
%%%%%%%%%%%%%%利用优化方法和ZNN model
[mj,nj]=size(J);
[p,llq]=size(matrixC(t));
lamuda1=4000;
lamb=10;
vectorb=-dr_xl-lamuda1*(r_xl-f_xl);

x=mydq;
rr02=myrr;
lm=mylm;

dot5=myPhi(x,rr02,lm,t)*matrixC(t);

dot6=myPhi(x,rr02,lm,t);

[mym,myn]=size(dot6);

dot6=myPhi(x,rr02,lm,t)-eye(mym,myn);

WWW=eye(8,8);

HH=[WWW,J',matrixC(t)';-J,zeros(mj,mj),zeros(mj,p);dot5,zeros(p,mj),dot6]; 

% %%%%%%%%regulation
[Hm,Hn]=size(HH);
mykappa=0.001;
HH=HH+mykappa*eye(Hm,Hn);
% %%%%%%%%%%%%%%%%%%%%%%%%

invH=inv(HH);
vech=[vectorg(x,t)+J'*rr02+matrixC(t)'*lm;-(J*x+vectorb);mypositivefun(x,rr02,lm,t)-lm];%vector h(y,t)

h=doth(x,rr02,lm,t,J,vectorb);%partial derivative of h(y,t) with respect to t  i.e., ht

dotx=-invH*(lamb*vech+h);%continuous ZNN model time-varying  


qDot=dotx(1:8,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PINV NVN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%for random noise
% if t>1
%    if flag1==0
%    R_noise=rand(3,1);
%    flag1=1; %%只进入一次
%    end
% end
% 
% if t>2
%    if flag2==0
%    R_noise=rand(3,1);
%    flag2=1;
%    end
% end
% 
% if t>3
%    if flag3==0
%    R_noise=rand(3,1);
%    flag3=1;
%    end
% end
% 
% if t>3
%    if flag4==0
%    R_noise=rand(3,1);
%    flag4=1;
%    end
% end
% 
% if t>5
%    if flag5==0
%    R_noise=rand(3,1);
%    flag5=1;
%    end
% end
% 
% if t>6
%    if flag6==0
%    R_noise=rand(3,1);
%    flag6=1;
%    end
% end
% 
% if t>7
%    if flag7==0
%    R_noise=rand(3,1);
%    flag7=1;
%    end
% end
% 
% if t>8
%    if flag8==0
%    R_noise=rand(3,1);
%    flag8=1;
%    end
% end
% 
% if t>9
%    if flag9==0
%    R_noise=rand(3,1);
%    flag9=1;
%    end
% end

%%%%%%%%%%%%%%%%%%%%

%qDot=-gamma*J'*(f_xl-r_xl);

% qDot=pinv(J)*(dr_xl+gamma*(r_xl-f_xl));

dphi=(r/(2*b))*(qDot(2,1)-qDot(1,1));

xycDot=[cos(phi),-sin(phi);sin(phi),cos(phi)]*[r/2,r/2;-d*r/2/b,d*r/2/b]*[qDot(1,1);qDot(2,1)];

doty=[xycDot;dphi;mydq;dotx];%some information superfluous
t






