function J=Jacob(Jphi,Jq) 

% function J=Jacob(Jq) 
%ian planar manipulator 2x4
% J is the 2x4 jocobian matrix of a 4dof planar, unit-link-length robot.
%Jq/Jtheta is a 4x1 column vector of angles in radians meansuring ccw from
%the previous link (from horizontal for the first link).
% Jq(1)=phil;
% Jq(2)=phir;
% Jq(3)=theta1;
% Jq(4)=theta2;
% Jq(5)=theta3;
% Jq(6)=theta4;
global h l1 l2 l3 l4 l5 l6 b d r J011 J012 J013 J014 J015 J021 R;
global J022 J023 J024 J025 J031 J032 J033 J034 J035 ; %#ok<NUSED>
global J11 J12 J13 J14 J15 J16; 
global J21 J22 J23 J24 J25 J26; 
global J31 J32 J33 J34 J35 J36;
% Jphi=0;
% b=4;
% d=3;
% r=0.2;%see IANnetW
% l1=1;
% l2=1;
% l3=1;
% l4=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�򻯺�sin()��cos()����ʽ��
% JACOBq=Jq
% JACOBq9=Jq(9)
% s4=sin(Jq(3)+Jq(4)+Jq(5)+Jq(6));
% s3=sin(Jq(3)+Jq(4)+Jq(5));
% s2=sin(Jq(3)+Jq(4));
% s1=sin(Jq(3));
% 
% c4=cos(Jq(3)+Jq(4)+Jq(5)+Jq(6));
% c3=cos(Jq(3)+Jq(4)+Jq(5));
% c2=cos(Jq(3)+Jq(4));
% c1=cos(Jq(3));
Jtheta=Jq;
c1=cos(Jtheta(1));        c2=cos(Jtheta(2));           c3=cos(Jtheta(3));
c4=cos(Jtheta(4));        c5=cos(Jtheta(5));           c6=cos(Jtheta(6));
c32=cos(Jtheta(3)+Jtheta(2));       % c65=cos(Jtheta(6)+Jtheta(5));
c1phi=cos(Jtheta(1)+Jphi);
s1=sin(Jtheta(1));s2=sin(Jtheta(2));s3=sin(Jtheta(3));
s4=sin(Jtheta(4));s5=sin(Jtheta(5));s6=sin(Jtheta(6));
s32=sin(Jtheta(3)+Jtheta(2));      %  s65=sin(Jtheta(6)+Jtheta(5));
s1phi=sin(Jtheta(1)+Jphi);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % �򻯺�sin()��cos()����ʽ��
% s4=sin(Jq(6)+Jq(7)+Jq(8)+Jq(9));
% s3=sin(Jq(6)+Jq(7)+Jq(8));
% s2=sin(Jq(6)+Jq(7));
% s1=sin(Jq(6));
% 
% c4=cos(Jq(6)+Jq(7)+Jq(8)+Jq(9));
% c3=cos(Jq(6)+Jq(7)+Jq(8));
% c2=cos(Jq(6)+Jq(7));
% c1=cos(Jq(6));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dphi=r/(2*b)*(Jq(1)-Jq(2));
% Jphi=quadl(@(dq(1),dq(2))dphi,0,2);
% function dphi=dphi(Jq(1),Jq(2))
%dphi=r/(2*b)*(dq(2)-dq(1));


% end
% function z=(Jq(1),Jq(2))
% z=r/(2*b)*(Jq(1)-Jq(2))
% end

%-----------------------------------------------------------------
% %ƽ���е�ۣ������������ӣ���jacob����,�±�ǰ�����0��ʾ����
% J015=l4*c4;
% J014=l3*c3+J015;
% J013=l2*c2+J014;
% J012=l1*c1+J013;
% J011=0;
% 
% J021=l1*s1+l2*s2+l3*s3+l4*s4;
% J022=0;
% J023=0;
% J024=0;
% J025=0;
% 
% J035=-l4*s4;
% J034=-l3*s3+J035;
% J033=-l2*s2+J034;
% J032=-l1*s1+J033;
% J031=0;
%-----------------------------------------------------------------
%������ά��е�۵�jacob����,�±�ǰ�����0��ʾ����;����С��ת��phi����������С��λ��
J011=(l6+l5)*(-c5*s32*s1phi+s5*c4*c32*s1phi+s5*s4*c1phi)-...
     (l4+l3)*s32*s1phi-l2*s2*s1phi;
J012=J011;
J013=(l6+l5)*(c5*c32*c1phi+s5*c4*s32*c1phi)+(l4+l3)*c32*c1phi+l2*c2*c1phi;
J014=(l6+l5)*(c5*c32*c1phi+s5*c4*s32*c1phi)+(l4+l3)*c32*c1phi;
J015=(l6+l5)*(s5*s4*c32*c1phi+s5*c4*s1phi);
J016=(l6+l5)*(-s5*s32*c1phi-c5*c4*c32*c1phi+c5*s4*s1phi);
J017=0;

J021=(l6+l5)*(c5*s32*c1phi-s5*c4*c32*c1phi+s5*s4*s1phi)+...
     (l4+l3)*s32*c1phi+l2*s2*c1phi;
J022=J021;
J023=(l6+l5)*(c5*c32*s1phi+s5*c4*s32*s1phi)+(l4+l3)*c32*s1phi+l2*c2*s1phi;
J024=(l6+l5)*(c5*c32*s1phi+s5*c4*s32*s1phi)+(l4+l3)*c32*s1phi;
J025=(l6+l5)*(s5*s4*c32*s1phi-s5*c4*c1phi);
J026=(l6+l5)*(-s5*s32*s1phi-c5*c4*c32*s1phi-c5*s4*c1phi);
J027=0;

J031=0;
J032=0;
J033=(l6+l5)*(s5*c4*c32-c5*s32)-(l4+l3)*s32-l2*s2;
J034=(l6+l5)*(s5*c4*c32-c5*s32)-(l4+l3)*s32;
J035=(l6+l5)*(-s5*s4*s32);
J036=(l6+l5)*(c5*c4*s32-s5*c32);
J037=0;

%-----------------------------------------------------------------
%���ƶ��������˶�ѧ����ͳһ֮���jacob���󣨶��һ�У�
% ��Ϊ�����2�����ӽ��ٶȱ��������Ǽ�����һ����phiһ�㡯������
J11=r/2*cos(Jphi)+d*r/2/b*sin(Jphi)-r/2/b*J011;
J12=r/2*cos(Jphi)-d*r/2/b*sin(Jphi)+r/2/b*J011;
J13=J012;
J14=J013;
J15=J014;
J16=J015;
J17=J016;
J18=J017;

J21=r/2*sin(Jphi)-d*r/2/b*cos(Jphi)-r/2/b*J021;
J22=r/2*sin(Jphi)+d*r/2/b*cos(Jphi)+r/2/b*J021;
J23=J022;
J24=J023;
J25=J024;
J26=J025;
J27=J026;
J28=J027;

J31=-J031*(r/2/b);
J32=-J31;
J33=J032;
J34=J033;
J35=J034;
J36=J035;
J37=J036;
J38=J037;


J=[J11,J12,J13,J14,J15,J16,J17,J18;...
    J21,J22,J23,J24,J25,J26,J27,J28;...
    J31,J32,J33,J34,J35,J36,J37,J38];
Jacob=size(J);



