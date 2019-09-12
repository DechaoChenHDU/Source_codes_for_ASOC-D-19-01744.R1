function [zx,zy,zz]=position(Jy)
%ian planar manipulator 2x4
% J is the 2x4 jocobian matrix of a 4dof planar, unit-link-length robot.
%q/theta is a 4x1 column vector of angles in radians meansuring ccw from
%the previous link (from horizontal for the first link).

% global  Pphi;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% global l1 l2 l3 l4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load SYSdata1;
pol1=l1;
% load SNDdata;
% load INITdata;
% dphi=(r/(2*d))*(dq(1,1)-dq(2,1));
% Pphi=0.01*dphi+Pphi;
PSy=size(Jy);
% s4=l4*sin(Jy(6)+Jy(7)+Jy(8)+Jy(9));
% s3=l3*sin(Jy(6)+Jy(7)+Jy(8));
% s2=l2*sin(Jy(6)+Jy(7));
% s1=l1*sin(Jy(6));
% c4=l4*cos(Jy(6)+Jy(7)+Jy(8)+Jy(9));
% c3=l3*cos(Jy(6)+Jy(7)+Jy(8));
% c2=l2*cos(Jy(6)+Jy(7));
% c1=l1*cos(Jy(6));
% POSIphi=Jy(1);
xc=Jy(1);
yc=Jy(2);
Pphi=Jy(3);
Ptheta=[Jy(6),Jy(7),Jy(8),Jy(9),Jy(10),Jy(11)];
c1=cos(Ptheta(1));        c2=cos(Ptheta(2));           c3=cos(Ptheta(3));
c4=cos(Ptheta(4));        c5=cos(Ptheta(5));           c6=cos(Ptheta(6));
c32=cos(Ptheta(3)+Ptheta(2));        %c65=cos(Ptheta(6)+Ptheta(5));
c1phi=cos(Ptheta(1)+Pphi);
s1=sin(Ptheta(1));s2=sin(Ptheta(2));s3=sin(Ptheta(3));
s4=sin(Ptheta(4));s5=sin(Ptheta(5));s6=sin(Ptheta(6));
s32=sin(Ptheta(3)+Ptheta(2));      %  s65=sin(Ptheta(6)+Ptheta(5));
s1phi=sin(Ptheta(1)+Pphi);

% x=[0;c1;c1+c2;c1+c2+c3;c1+c2+c3+c4];
% Jy=[0;s1;s1+s2;s1+s2+s3;s1+s2+s3+s4];
Peeff6=[0;0;l6;1];%end-effector in coordinates 5;
j6in5=[0;l5;0;1];    j5in4=[0;0;l4;1];  j4in3=[0;l3;0;1]; j3in2=[0;l2;0;1];
j2in1=[0;0;l1;1];    j1inc=[0;0;h;1];   cinw=[xc;yc;0;1];
% t12inc=[0;0;l1+h;1]; 
%the transition matrixes are as follows
 
T56=[c6,-s6,0,0;...
     0,0,1,l5;...
     -s6,-c6,0,0;...
     0,0,0,1];
 T45=[c5,-s5,0,0;...
     0,0,-1,0;...
     s5,c5,0,l4;...
     0,0,0,1];
 T34=[c4,-s4,0,0;...
     0,0,1,l3;...
     -s4,-c4,0,0;...
     0,0,0,1];
 T23=[c3,s3,0,0;...
     -s3,c3,0,l2;...
     0,0,1,0;...
     0,0,0,1];
 T12=[c2,s2,0,0;...
     0,0,-1,0;...
     -s2,c2,0,l1;...
     0,0,0,1];
 Tc1=[c1,-s1,0,0;...
     s1,c1,0,0;...
     0,0,1,h;...
     0,0,0,1];
 Twc=[cos(Pphi),-sin(Pphi),0,xc;...
     sin(Pphi),cos(Pphi),0,yc;...
     0,0,1,0;...
     0,0,0,1];
 %c is the origin of coordinates on mobile platform
 
 
 %~~~~~~~~~~~~~~~~~~~~~~~~~~joint position~~~~~~~~~~~~~~~~~~~~~~~
  Peeff=Twc*Tc1*T12*T23*T34*T45*T56*Peeff6;
    j6p=Twc*Tc1*T12*T23*T34*T45*j6in5;
    j5p=Twc*Tc1*T12*T23*T34*j5in4;
    j4p=Twc*Tc1*T12*T23*j4in3;
    j3p=Twc*Tc1*T12*j3in2;
    j2p=Twc*Tc1*j2in1;
    j1p=Twc*j1inc;
%    t12p=Twc*t12inc; %word版本的公式推导中绿色关节的一个拐弯处
 
 %word版本的公式推导中绿色关节含有一个拐弯处，这里忽略
 zx=[xc;j1p(1);j2p(1);j3p(1);j4p(1);j5p(1);j6p(1);Peeff(1)];
 zy=[yc;j1p(2);j2p(2);j3p(2);j4p(2);j5p(2);j6p(2);Peeff(2)];
 zz=[0 ;j1p(3);j2p(3);j3p(3);j4p(3);j5p(3);j6p(3);Peeff(3)];
 
 
 
% zx=xc+cos(Pphi)*[0;s1;s1+s2;s1+s2+s3;s1+s2+s3+s4];
% zy=yc+sin(Pphi)*[0;s1;s1+s2;s1+s2+s3;s1+s2+s3+s4];
% zz=[0;c1;c1+c2;c1+c2+c3;c1+c2+c3+c4];













