clc;
clear all;
close all;
format long;
% h=4.51; l1=2.5; l12=0; l2=4.5; l3=2; l4=1; l5=0.3;l6=0.2;
% b=3;d=1.5;%according to the shanghai one
h=4.51; l1=2.5; l12=0; l2=4.5; l3=2; l4=1; l5=2.3;l6=3.2;
b=3;d=1.5;

% phi=pi/2;
phi=pi/2;
xc=3;
yc=5;

qa=[0;0;0;0;0;0];
qb=[pi/12;0;0;0;0;0];
qc=[pi/12;pi/6;0;0;0;0];
qd=[pi/12;pi/6;pi/3;0;0;0];
qe=[pi/12;pi/6;pi/3;pi/12;0;0];
qf=[pi/2;pi/2;pi/2;pi/2;pi/2;pi/2];
% qg=[pi/5;1*pi/5;-pi/8;-pi/13;pi/9;pi/8];
qg=[pi/5;11*pi/5;-pi/3;-pi/6;pi/4;pi/5];

theta=qf;%could be select from qa to qg, and so on

c1=cos(theta(1));        c2=cos(theta(2));           c3=cos(theta(3));
c4=cos(theta(4));        c5=cos(theta(5));           c6=cos(theta(6));
c32=cos(theta(3)+theta(2));        c65=cos(theta(6)+theta(5));
c1phi=cos(theta(1)+phi);
s1=sin(theta(1));s2=sin(theta(2));s3=sin(theta(3));
s4=sin(theta(4));s5=sin(theta(5));s6=sin(theta(6));
s32=sin(theta(3)+theta(2));        s65=sin(theta(6)+theta(5));
s1phi=sin(theta(1)+phi);

Peeff6=[l6;0;0;1];%end-effector in coordinates 5;
j6in5=[l5;0;0;1];    j5in4=[0;0;l4;1];  j4in3=[l3;0;0;1]; j3in2=[l2;0;0;1];
j2in1=[0;-l12;l1;1]; t12inc=[0;0;l1+h;1]; j1inc=[0;0;h;1];cinw=[xc;yc;0;1];
%the transition matrixes are as follows
 
 T56=[c6,-s6,0,l5;...
     s6,c6,0,0;...
     0,0,1,0;...
     0,0,0,1];
 T45=[0,0,-1,0;...
     s5,c5,0,0;...
     c5,-s5,0,l4;...
     0,0,0,1];
 T34=[0,0,1,l3;...
     -s4,c4,0,0;...
     -c4,-s4,0,0;...
     0,0,0,1];
 T23=[c3,-s3,0,l2;...
     s3,c3,0,0;...
     0,0,1,0;...
     0,0,0,1];
 T12=[s2,c2,0,0;...
     0,0,-1,-l12;...
     -c2,s2,0,l1;...
     0,0,0,1];
 Tc1=[c1,-s1,0,0;...
     s1,c1,0,0;...
     0,0,1,h;...
     0,0,0,1];
 Twc=[cos(phi),-sin(phi),0,xc;...
     sin(phi),cos(phi),0,yc;...
     0,0,1,0;...
     0,0,0,1];
 %c is the origin of coordinates on mobile platform
 
 
 %~~~~~~~~~~~~~~~~~~~~~~~~~~multiply~form~~~~~~~~~~~~~~~~~~~~~~~
 Peeff=Twc*Tc1*T12*T23*T34*T45*T56*Peeff6
 %~~~~~~~~~~~~~~~~~~~~~compact~form~for~test~~~~~~~~~~~~~~~~~~~~~~~~~~
  TTT=[l6*(c65*s32*c1phi+s65*c4*c32*c1phi-s65*s4*s1phi)+l5*(c5*s32*c1phi+s5*c4*c32*c1phi-s5*s4*s1phi)+(l4+l3)*s32*c1phi+l2*s2*c1phi+l12*s1phi;...
      l6*(c65*s32*s1phi+s65*c4*c32*s1phi+s65*s4*c1phi)+l5*(c5*s32*s1phi+s5*c4*c32*s1phi+s5*s4*c1phi)+(l4+l3)*s32*s1phi+l2*s2*s1phi-l12*c1phi;...
     l6*(-c65*c32+s65*c4*s32)-l5*(c5*c32-s5*c4*s32)-(l4+l3)*c32-l2*c2+l1+h;...
     0]; 
 Peeff2=cinw+TTT
% TTT=[l6*c65+l5*c5+(l4+l3);...
%       l6*s65*c4+l5*s5*c4;...
%      l6*(-s65*s4)-l5*s5*s4;...
%      1]; 
%  Peeff2=Twc*Tc1*T12*T23*TTT
%  TTT=[l6*(c65*c3-s65*c4*s3)+l5*(c5*c3-s5*c4*s3)+(l4+l3)*c3+l2;...
%       l6*(c65*s3+s65*c4*c3)+l5*(c5*s3+s5*c4*c3)+(l4+l3)*s3;...
%      l6*(-s65*s4)-l5*s5*s4;...
%      1]; 
%  Peeff2=Twc*Tc1*T12*TTT
%  TTT=[l6*(c65*s32+s65*c4*c32)+l5*(c5*s32+s5*c4*c32)+(l4+l3)*s32+l2*s2;...
%       l6*s65*s4+l5*s5*s4-l12;...
%      l6*(s65*c4*s32-c65*c32)-l5*(c5*c32-s5*c4*s32)-(l4+l3)*c32-l2*c2+l1;...
%      1]; 
%  Peeff2=Twc*Tc1*TTT

 %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 Peeff2Peeff=Peeff2-Peeff
    %joint position
    j6p=Twc*Tc1*T12*T23*T34*T45*j6in5;
    j5p=Twc*Tc1*T12*T23*T34*j5in4;
    j4p=Twc*Tc1*T12*T23*j4in3;
    j3p=Twc*Tc1*T12*j3in2;
    j2p=Twc*Tc1*j2in1;
   t12p=Twc*t12inc;
    j1p=Twc*j1inc;
  
   peeffx=Peeff(1); peeffy=Peeff(2); peeffz=Peeff(3);
   peeffx2=Peeff2(1); peeffy2=Peeff2(2); peeffz2=Peeff2(3);%for compare
   j6px=j6p(1); j6py=j6p(2); j6pz=j6p(3);
   j5px=j5p(1); j5py=j5p(2); j5pz=j5p(3);
   j4px=j4p(1); j4py=j4p(2); j4pz=j4p(3);
   j3px=j3p(1); j3py=j3p(2); j3pz=j3p(3);
   j2px=j2p(1); j2py=j2p(2); j2pz=j2p(3);
   t12px=t12p(1);t12py=t12p(2);t12pz=t12p(3);
   j1px=j1p(1); j1py=j1p(2); j1pz=j1p(3);

    linksX=[xc;j1px;t12px;j2px;j3px;j4px;j5px;j6px;peeffx];
    linksY=[yc;j1py;t12py;j2py;j3py;j4py;j5py;j6py;peeffy];
    linksZ=[0;j1pz;t12pz;j2pz;j3pz;j4pz;j5pz;j6pz;peeffz];
    
    %the mobile platform
    xLB=xc-sqrt(b^2+d^2)*cos(atan(b/d)-phi);
    yLB=yc+sqrt(b^2+d^2)*sin(atan(b/d)-phi);
    xRB=xc-sqrt(b^2+d^2)*cos(atan(b/d)+phi);
    yRB=yc-sqrt(b^2+d^2)*sin(atan(b/d)+phi);
    platformX=[xLB;xRB;xc;xLB];
    platformY=[yLB;yRB;yc;yLB];
    platformZ=[0;0;0;0];
 
plot3(linksX,linksY,linksZ,platformX,platformY,platformZ);
hold on;
plot3(5,5,0,-5,-5,0)
plot3(peeffx2,peeffy2,peeffz2,'b*')
    xlabel('x');
    ylabel('y');
    zlabel('z');
axis equal
grid on
hold off;









