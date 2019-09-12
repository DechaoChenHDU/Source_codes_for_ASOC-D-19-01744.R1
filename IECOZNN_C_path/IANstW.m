%6-link mobile manipulator
clc;
close all;
clear;
format long;
global aa rr Talpha mmm nnn h l1 l2 l3 l4 l5 l6 b d r xc yc init mm nn pp;
global R n m n3m1 sBound A  alpha Nalpha bP dP dM In3m1 R_noise gol;
global T qa qP qM qDp qDm beta q0 theta0 Pinfty Minfty gamma myInf ...
       cclalpha taskstartangle;
global flag1 flag2 flag3 flag4 flag5 flag6 flag7 flag8 flag9;

flag1=0;
flag2=0;
flag3=0;
flag4=0;
flag5=0;
flag6=0;
flag7=0;
flag8=0;
flag9=0;
% n=6;
n=8;
m=3;
gol=1;
R_noise=rand(3,1); %%Time varing noise（arbitrary example）

h=0.698; l1=0.065; l2=0.555; l3=0.19; l4=0.13; l5=0.082;%地面高度算在h内
l6=0.018;
b=0.32;d=0.1;
r=0.1025;
%%============================================

T=3; %2.8; %may need adjust
% rr=0.45;%0.4
rr=0.1;%0.4
aa=1.2;%0.4
Talpha=pi/6;
alpha=pi/6;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta0=[pi/12;pi/12;pi/12;pi/12;pi/12;pi/12];
% theta0=[0;pi/3;pi/6;pi;pi/2;0];
q0=[0;0;theta0];%phiL,phiR,theta1~theta6,
% qh=[2*pi/3;q0];
qh=[0;q0];

xc=0;
yc=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Dual vector
r0=[5;5;5];
lm0=-100*ones(16,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x0=[0.001*ones(2,1);0.001*ones(6,1)];%abitrary initial

init=[xc;yc;qh;x0;r0;lm0];% xc, yc, phi, phiL, phiR, theta1~theta6
% init
% init=[q0;u0;Nalpha];

save SYSdata1 h l1 l2 l3 l4 l5 l6 b d r xc yc mm nn pp rr mmm...
    cclalpha nnn init;

% options=odeset('RelTol',1e-5,'AbsTol',1e-7*ones(4*n+m+1,1));
%options=odeset('RelTol',1e-5,'AbsTol',1e-7*ones(n+3,1));
options=odeset('RelTol',1e-4,'AbsTol',1e-7*ones(n+3+8+16+3,1));
%  options=odeset('Mass',@dotfx,'MStateDep','strong');
tic;
% figure('Name',strcat('目标轨迹'));
[t,y]=ode45('IANnetW',[0:0.001:T],init,options);%ode15s much better than ode45

save SYSdata Talpha rr aa n m T alpha qP qM qDp qDm beta q0 theta0 Pinfty...
     Minfty sBound A bP taskstartangle;
% 
save INITdata t y Nalpha;
