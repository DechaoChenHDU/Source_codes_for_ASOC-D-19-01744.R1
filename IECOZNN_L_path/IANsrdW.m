

%calculate the errors
close all;
clear all;
format long;
global h l1 l12 l2 l3 l4 l5 l6 b d r rr mmm nnn y mm nn pp n phi m n1;
global n3m1 sBound A bP b In3m1 T radiusXY0 angleXY0 qP qM qDp qDm...
       Minfty k Pinfty beta q q0 gamma myInf R taskstartangle aa;
global Talpha init
load SYSdata
load SYSdata1
load SNDdata
% srdl1=l1
% load INITdata;

[Ppx,Ppy,Ppz]=position(init);
ix=Ppx(8);
iy=Ppy(8);
iz=Ppz(8);
desired_p=aa*T*(T-T*sin(2*pi*T/T)/(2*pi))/(2*pi);
ix1=0.5*desired_p+ix; iy1=-sqrt(3/4)*desired_p+iy;
ix2=0.5*desired_p+ix1; iy2=sqrt(3/4)*desired_p+iy1;
ix3=-0.5*desired_p+ix2; iy3=sqrt(3/4)*desired_p+iy2;

for jj=1:length(t)
    qjj=qAll(jj,:)';
    SRDqjj=qjj;%simulated end effector position
    [Ppx,Ppy,Ppz]=position(qjj);%正解（区别于反解）
    B=[Ppx,Ppy,Ppz];
    %-----------------方形底盘x可能杂乱看不清
%     wlfx(jj,1)=Ppx(1)-b*sin(y(jj,3));
%     wrfx(jj,1)=Ppx(1)+b*sin(y(jj,3));
%     wlpx(jj,1)=Ppx(1)-sqrt(b^2+d^2)*cos(atan(b/d)-y(jj,3));%backwheel
%     wrpx(jj,1)=Ppx(1)-sqrt(b^2+d^2)*cos(atan(b/d)+y(jj,3));%记得在最后save一下
    %-----------------三角形底盘x
    wlpx(jj,1)=Ppx(1)-sqrt(b^2+d^2)*cos(atan(b/d)-y(jj,3));%backwheel
    wrpx(jj,1)=Ppx(1)-sqrt(b^2+d^2)*cos(atan(b/d)+y(jj,3));%记得在最后save一下
    wlfx(jj,1)=Ppx(1);
    wrfx(jj,1)=Ppx(1);
    carcx(jj,1)=Ppx(1);
    j1px(jj,1)=Ppx(2);
    j2px(jj,1)=Ppx(3);
    j3px(jj,1)=Ppx(4);
    j4px(jj,1)=Ppx(5);%%%
    j5px(jj,1)=Ppx(6);%%%
    j6px(jj,1)=Ppx(7);%%%
    j7px(jj,1)=Ppx(8);%%%
    posx(jj,1)=Ppx(8);
    %-----------------方形底盘y可能杂乱看不清
%     wlfy(jj,1)=Ppy(1)+b*cos(y(jj,3));
%     wrfy(jj,1)=Ppy(1)-b*cos(y(jj,3));
%     wlpy(jj,1)=Ppy(1)+sqrt(b^2+d^2)*sin(atan(b/d)-y(jj,3));
%     wrpy(jj,1)=Ppy(1)-sqrt(b^2+d^2)*sin(atan(b/d)+y(jj,3));
    %-----------------三角形底盘y
    wlpy(jj,1)=Ppy(1)+sqrt(b^2+d^2)*sin(atan(b/d)-y(jj,3));
    wrpy(jj,1)=Ppy(1)-sqrt(b^2+d^2)*sin(atan(b/d)+y(jj,3));
    wlfy(jj,1)=Ppy(1);
    wrfy(jj,1)=Ppy(1);
    carcy(jj,1)=Ppy(1);
    j1py(jj,1)=Ppy(2);
    j2py(jj,1)=Ppy(3);
    j3py(jj,1)=Ppy(4);
    j4py(jj,1)=Ppy(5);%%%
    j5py(jj,1)=Ppy(6);%%%
    j6py(jj,1)=Ppy(7);%%%
    j7py(jj,1)=Ppy(8);%%%
    posy(jj,1)=Ppy(8);
    %-----------------z
    wlfz(jj,1)=0;
    wrfz(jj,1)=0;
    wlpz(jj,1)=0;
    wrpz(jj,1)=0;
    carcz(jj,1)=Ppz(1);
    j1pz(jj,1)=Ppz(2);
    j2pz(jj,1)=Ppz(3);
    j3pz(jj,1)=Ppz(4);
    j4pz(jj,1)=Ppz(5);%%%
    j5pz(jj,1)=Ppz(6);%%%
    j6pz(jj,1)=Ppz(7);%%%
    j7pz(jj,1)=Ppz(8);%%%
    posz(jj,1)=Ppz(8);
    %--------------------------------------------------------
    dqjj=dqAll(jj,4:11)';%simulated end effector velocity
   
    norodq(jj,1)=norm(dqjj);
    
%     for i=1:n,
    for i=1:6,
        q(i,1)=y(jj,i+5);
    end
    phi=y(jj,3);   
    J=Jacob(phi,q);
    
    dpos=J*dqjj;
    dposx(jj,1)=dpos(1);
    dposy(jj,1)=dpos(2);
    dposz(jj,1)=dpos(3);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LSR path
    %--Desired rt and ddrt--   
%    phi_sin=2*pi*sin(0.5*pi*t(jj)/T);
%    Tphi=phi_sin*sin(0.5*pi*t(jj)/T);
%    phiDot=phi_sin*pi*cos(0.5*pi*t(jj)/T)/T;
%    
%    ry(jj,1)=rr*cos(2*Tphi+Talpha)+ix;
%    rx(jj,1)=rr*sin(Tphi+Talpha)+iy;
%    rz(jj,1)=iz;
%    
%    dry(jj,1)=-2*rr*sin(2*Tphi+Talpha)*phiDot;
%    drx(jj,1)=rr*cos(Tphi+Talpha)*phiDot;
%    drz(jj,1)=0;
   
   
   phi_sin=2*pi*sin(0.5*pi*t(jj)/T);
   Tphi=phi_sin*sin(0.5*pi*t(jj)/T);
   phiDot=phi_sin*pi*cos(0.5*pi*t(jj)/T)/T;
   
   rx(jj,1)=rr*cos(2*Tphi+Talpha)+ix-rr*cos(Talpha);
   ry(jj,1)=rr*sin(Tphi+Talpha)+iy-rr*sin(Talpha);
   rz(jj,1)=iz;
   
   drx(jj,1)=-2*rr*sin(2*Tphi+Talpha)*phiDot;
   dry(jj,1)=rr*cos(Tphi+Talpha)*phiDot;
   drz(jj,1)=0;
   
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %--Desired rt and ddrt--  C_path_20190411
   
%    phi_sin=2*pi*sin(0.5*pi*t(jj)/T);
%    phi_sinDot=pi*pi*cos(0.5*pi*t(jj)/T)/T;
%    cphi=phi_sin*sin(0.5*pi*t(jj)/T);
%    phiDot=phi_sin*pi*cos(0.5*pi*t(jj)/T)/T;
%    phiDotDot=pi*phi_sinDot*cos(0.5*pi*t(jj)/T)/T-pi*pi*phi_sin*sin(0.5*pi*t(jj)/T)/(2*T*T);
%    rx(jj,1)=rr*cos(cphi)+ix-rr;
%    ry(jj,1)=rr*cos(alpha)*sin(cphi)+iy;
%    rz(jj,1)=rr*sin(alpha)*sin(cphi)+iz;
%    drx(jj,1)=-rr*sin(cphi)*phiDot;
%    dry(jj,1)=rr*cos(cphi)*cos(alpha)*phiDot;
%    drz(jj,1)=rr*cos(cphi)*sin(alpha)*phiDot;
   
%    %%%%%%%%%%%%%%%%%%%%%%%%%%%%% W
% %  --Desired rt and ddrt--   
%  if t(jj)<=T,
%     desired_v=aa*T*(1-cos(2*pi*t(jj)/T))/(2*pi);
%     drx(jj,1)=0.5*desired_v;
%     dry(jj,1)=-sqrt(3/4)*desired_v;
%     drz(jj,1)=0;
%     desired_p=aa*T*(t(jj)-T*sin(2*pi*t(jj)/T)/(2*pi))/(2*pi);
%     rx(jj,1)=0.5*desired_p+ix;
%     ry(jj,1)=-sqrt(3/4)*desired_p+iy;
%     rz(jj,1)=iz;
% elseif t(jj)<=2*T,
%     desired_v=aa*T*(1-cos(2*pi*(t(jj)-T)/T))/(2*pi);
%     drx(jj,1)=0.5*desired_v;
%     dry(jj,1)=sqrt(3/4)*desired_v;
%     drz(jj,1)=0;
%     desired_p=aa*T*((t(jj)-T)-T*sin(2*pi*(t(jj)-T)/T)/(2*pi))/(2*pi);
%     rx(jj,1)=0.5*desired_p+ix1;
%     ry(jj,1)=sqrt(3/4)*desired_p+iy1;
%     rz(jj,1)=iz;
% elseif t(jj)<=3*T,
%     desired_v=aa*T*(1-cos(2*pi*(t(jj)-2*T)/T))/(2*pi);
%     drx(jj,1)=-0.5*desired_v;
%     dry(jj,1)=sqrt(3/4)*desired_v;
%     drz(jj,1)=0;
%     desired_p=aa*T*((t(jj)-2*T)-T*sin(2*pi*(t(jj)-2*T)/T)/(2*pi))/(2*pi);
%     rx(jj,1)=-0.5*desired_p+ix2;
%     ry(jj,1)=sqrt(3/4)*desired_p+iy2;
%     rz(jj,1)=iz;
% elseif t(jj)<=4*T,
%     desired_v=aa*T*(1-cos(2*pi*(t(jj)-3*T)/T))/(2*pi);
%     drx(jj,1)=-0.5*desired_v;
%     dry(jj,1)=-sqrt(3/4)*desired_v;
%     drz(jj,1)=0;
%     desired_p=aa*T*((t(jj)-3*T)-T*sin(2*pi*(t(jj)-3*T)/T)/(2*pi))/(2*pi);
%     rx(jj,1)=-0.5*desired_p+ix3;
%     ry(jj,1)=-sqrt(3/4)*desired_p+iy3;
%     rz(jj,1)=iz;
% end
%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


    end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--Errors-

erposx=(rx-posx);
erposy=(ry-posy);
erposz=(rz-posz);
% 
erdposx=drx-dposx;
erdposy=dry-dposy;
erdposz=drz-dposz;

 CDCRes=sqrt(erposx.*erposx+erposy.*erposy+erposz.*erposz);

 
% save SRDdata1 t qAll  xL yL zL dxL dyL dzL k q0;
save SRDdata1 t qAll k q0...
     dqAll posx posy posz dposx dposy dposz CDCRes norodq;
save SRDdata2  erposx erposy erposz erdposx erdposy erdposz;
save SRDdata3  wrfz wlfz wrfy wlfy wlfx wrfx wlpx wlpy wlpz wrpx wrpy...
               wrpz carcx carcy carcz...
                    j1px j2px j3px j4px j5px j6px j7px...
                    j1py j2py j3py j4py j5py j6py j7py...
                    j1pz j2pz j3pz j4pz j5pz j6pz j7pz...
                    rx ry rz drx dry drz;           