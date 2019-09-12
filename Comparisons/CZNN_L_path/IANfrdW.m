 close all;
clear all;
format long;
global n m sBound A bP b dP dM In3m1 T mu qP qM qDp qDm beta q0;
load SYSdata;
load SYSdata1;
load SRDdata1;
load SRDdata2;
load SRDdata3;
load SNDdata;


%==plotting angles==
% figure;
% plot(t,qAll);hold on;
% title('Simulated theta');xlabel('t (Second)');ylabel('rad');
% legend('\theta_1','\theta_2','\theta_3','\theta_4');



%%%%%%%%%%%%%%%%%%% qAll%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot(t,qAll(:,1),t,qAll(:,2));hold on;
%plot([0,10],[0,0]);
%   set(h(4,1),'color',[0 0.5 0],'LineWidth',3)
%   set(h(2,1),'color',[0 0.6 0],'LineWidth',3)
legend('xc','yc','zc')

figure
plot(t,qAll(:,6),...
      t,qAll(:,7),t,qAll(:,8),...
      t,qAll(:,9),...
      t,qAll(:,10),...
      t,qAll(:,11));
%   set(h(4,1),'color',[0 0.5 0],'LineWidth',3)
%   set(h(2,1),'color',[0 0.6 0],'LineWidth',3)
legend('theta1','theta2','theta3','theta4','theta5','theta6')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure
plot(t,dqAll(:,6),...
      t,dqAll(:,7),t,dqAll(:,8),...
      t,dqAll(:,9),...
      t,dqAll(:,10),...
      t,dqAll(:,11));hold on;
%   set(h(4,1),'color',[0 0.5 0],'LineWidth',3)
%   set(h(2,1),'color',[0 0.6 0],'LineWidth',3)
legend('dtheta1','dtheta2','dtheta3','dtheta4','dtheta5','dtheta6')
plot([0 3],[1.2 1.2]);hold on;
plot([0 3],[-1.2 -1.2]);hold on;
% text(9.7,-4.5,'t(s)')
% text(0.5,2.5,'rad/s')
% box off;

figure
plot(t,y(:,4),t,y(:,5));
legend('phiL','phiR')
text(9.7,-6,'t(s)')
text(0.5,65,'rad')
% box off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot(t,dqAll(:,4),t,dqAll(:,5));hold on;
plot([0 3],[0.5 0.5]);hold on;
plot([0 3],[-0.5 -0.5]);hold on;
legend('dqL','dqR')
% text(9.7,-5.2,'t(s)')
% text(0.5,7.2,'rad/s')
% box off;

% 
% figure
%        plot(t,sin(qAll(:,3)));
%        legend('Phi')
%        text(9.7,-2.5,'t(s)')
%        text(0.5,4.6,'phi(rad)')
%        box off;
       
% figure
%        plot(t,dqAll(:,3));
%         legend('dPhi')
%        text(9.7,0.1,'t(s)')
%        text(0.5,1.52,'dphi(rad/s)')
%        box off;
       
       
% figure
%        plot(t,qAll(:,1),t,qAll(:,2));
%        legend('xc','yc')
%        text(9.7,-0.8,'t(s)')
%        text(0.5,1.8,'m')
%        box off;
       
% figure
%        plot(t,dqAll(:,1),t,dqAll(:,2));
%        legend('dxc','dyc')
%        text(9.7,-0.35,'t(s)')
%        text(0.75,0.36,'m/s')
%        box off;
    
 figure;      
 plot3(rx,ry,rz,'r-.','linewidth',2);  hold on; 
      plot3(j7px,j7py,j7pz,'b*','linewidth',1)
      legend('desired path','end-effector trajectory');
      axis equal;

%       erposx=rx-j7px;
%       erposy=ry-j7py;
     
      
%figure
%plot(t,CDCRes);
% figure
% %       plot3(rx,ry,rz,'r-.','linewidth',2);      hold on;
% %       plot3(j7px,j7py,j7pz,'b*','linewidth',1);
%       
%       plot(rx,ry,j7px,j7py);      
%       legend('desired path','end-effector trajectory')
%       axis equal;
%       text(0.2,-1.4,0.43,'X(m)')
%       text(-1.35,0.55,0.43,'Y(m)')
%       text(-1,1.98,0.79,'Z(m)')
%       grid on;

figure
plot(t,erposx,t,erposy,t,erposz);
% set(hh(3,1),'LineWidth',3)
% text(0.5,4.53e-5,'Position Error(m)');
legend('ex','ey','ez');
% box off;

%%%%%%%%%%%%%%%%%%%Res
% CDCRes=sqrt(erposx.*erposx+erposy.*erposy+erposz.*erposz);

% figure
% plot(t,CDCRes);
% %%%%%%%%%%%%

figure
plot(t,norodq);
%%%%%%%%%%%%%%%%%

figure
hhh=plot(t,erdposx,t,erdposy,t,erdposz);
% set(hhh(3,1),'LineWidth',3)
% title(' Error');
text(9.7,-3.45e-14,'t(s)');
text(0.5,3.53e-14,'Velocity Error(m/s)');
legend('normedx','normedy','normedz');
% box off;

figure
    h=plot(t,posx,t,posy,t,posz);
    legend('rx','ry','rz');
%     set(k(1,1),'color',[0.6,0.2,0],'linewidth',4);%一次只能设置一条曲线
%     set(k(2,1),'color',[0.8,0.6,0.6],'linewidth',3);
%     set(k(3,1),'color',[0,0.5,0],'linewidth',4);
%     box off

%     
figure
    h=plot(t,dposx,t,dposy,t,dposz,t,drx,t,dry,t,drz);
%     set(k(1,1),'color',[0.6,0.2,0],'linewidth',4);%一次只能设置一条曲线
%     set(k(2,1),'color',[0.8,0.6,0.6],'linewidth',3);
%     set(k(3,1),'color',[0,0.5,0],'linewidth',4);
    legend('dposx','dposy','dposz','drx','dry','drz');
%     text(8,-0.45,'t(s)');
%     text(0.8,0.45,'m/s');
%     box off
    
    
     

    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%角度受到角度极限约束图%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
% qP1=qP(1)*ones(size(t));
% qP2=qP(2)*ones(size(t));
% qP3=qP(3)*ones(size(t));
% qP4=qP(4)*ones(size(t));
% qP5=qP(5)*ones(size(t));
% qP6=qP(6)*ones(size(t));
% qP7=qP(7)*ones(size(t));
% qP8=qP(8)*ones(size(t));
% 
% qM1=qM(1)*ones(size(t));
% qM2=qM(2)*ones(size(t));
% qM3=qM(3)*ones(size(t));
% qM4=qM(4)*ones(size(t));
% qM5=qM(5)*ones(size(t));
% qM6=qM(6)*ones(size(t));
% qM7=qM(7)*ones(size(t));
% qM8=qM(8)*ones(size(t));
%     
% figure;
% plot(t,qAll(:,4),'c-','linewidth',4);
% hold on;
% title('Simulated theta subject to limit phil');
% plot(t,qP1,'k--', 'linewidth',2);
% hold on;
% plot(t,qM1,'k--', 'linewidth',2);
% hold on;
% % legend('q1','qL1');
% 
% %    
% figure;
% plot(t,qAll(:,5),'k--','linewidth',4);
% hold on;
% title('Simulated theta subject to limit phiR2');
% plot(t,qP2,'k--', 'linewidth',2);
% hold on;
% plot(t,qM2,'k--', 'linewidth',2);
% hold on;
% % legend('q2','qL2');
% 
% 
% 
% figure;
% plot(t,qAll(:,6),'b-.','linewidth',1.5);hold on;
% title('Simulated theta subject to limit theta1');
% plot(t,qP3,'k--', 'linewidth',2);
% hold on;
% plot(t,qM3,'k--', 'linewidth',2);
% hold on;
% % legend('q3','qL3');
% 
% 
% 
% figure;
% plot(t,qAll(:,7),'g--','linewidth',1.5);hold on;
% title('Simulated theta subject to limit theta2');
% plot(t,qP4,'k--', 'linewidth',2);
% hold on;
% plot(t,qM4,'k--', 'linewidth',2);
% hold on;
% % legend('q4','qL4');
% 
% figure;
% plot(t,qAll(:,8),'r:','linewidth',1.5);hold on;
% title('Simulated theta subject to limit theta3');
% plot(t,qP5,'k--', 'linewidth',2);
% hold on;
% plot(t,qM5,'k--', 'linewidth',2);
% hold on;
% % legend('q5','qL5');
% 
% figure;
% plot(t,qAll(:,9),'m-','linewidth',1.5);hold on;
% title('Simulated theta subject to limit theta4');
% plot(t,qP6,'k--', 'linewidth',2);
% hold on;
% plot(t,qM6,'k--', 'linewidth',2);
% hold on;
% % legend('q6','qP6');
% 
% 
% figure;
% plot(t,qAll(:,10),'m-','linewidth',1.5);hold on;
% title('Simulated theta subject to limit theta5');
% plot(t,qP7,'k--', 'linewidth',2);
% hold on;
% plot(t,qM7,'k--', 'linewidth',2);
% hold on;
% % legend('q6','qP6');
% 
% figure;
% plot(t,qAll(:,11),'m-','linewidth',1.5);hold on;
% title('Simulated theta subject to limit theta6');
% plot(t,qP8,'k--', 'linewidth',2);
% hold on;
% plot(t,qM8,'k--', 'linewidth',2);
% hold on;
% % legend('q6','qP6');
%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%关节速度受角度和速度极限综合后极限下的图%%%%%%%%%%%%
%     
% qPL(:,1)=qP(1)*ones(length(t),1);
% qPL(:,2)=qP(2)*ones(length(t),1);
% qPL(:,3)=qP(3)*ones(length(t),1);
% qPL(:,4)=qP(4)*ones(length(t),1);
% qPL(:,5)=qP(5)*ones(length(t),1);
% qPL(:,6)=qP(6)*ones(length(t),1);
% qPL(:,7)=qP(7)*ones(length(t),1);
% qPL(:,8)=qP(8)*ones(length(t),1);
% 
% qML(:,1)=qM(1)*ones(length(t),1);
% qML(:,2)=qM(2)*ones(length(t),1);
% qML(:,3)=qM(3)*ones(length(t),1);
% qML(:,4)=qM(4)*ones(length(t),1);
% qML(:,5)=qM(5)*ones(length(t),1);
% qML(:,6)=qM(6)*ones(length(t),1);
% qML(:,7)=qM(7)*ones(length(t),1);
% qML(:,8)=qM(8)*ones(length(t),1);
%        
% qDpL(:,1)=qDp(1)*ones(length(t),1);
% qDpL(:,2)=qDp(2)*ones(length(t),1);
% qDpL(:,3)=qDp(3)*ones(length(t),1);
% qDpL(:,4)=qDp(4)*ones(length(t),1);
% qDpL(:,5)=qDp(5)*ones(length(t),1);
% qDpL(:,6)=qDp(6)*ones(length(t),1);
% qDpL(:,7)=qDp(7)*ones(length(t),1);
% qDpL(:,8)=qDp(8)*ones(length(t),1);
% 
% qDmL(:,1)=qDm(1)*ones(length(t),1);
% qDmL(:,2)=qDm(2)*ones(length(t),1);
% qDmL(:,3)=qDm(3)*ones(length(t),1);
% qDmL(:,4)=qDm(4)*ones(length(t),1);
% qDmL(:,5)=qDm(5)*ones(length(t),1);
% qDmL(:,6)=qDm(6)*ones(length(t),1);
% qDmL(:,7)=qDm(7)*ones(length(t),1);
% qDmL(:,8)=qDm(8)*ones(length(t),1);
%     
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% xi_pp=beta*(qPL-qAll(:,4:11));
% xi_pm=beta*(qML-qAll(:,4:11));
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%     
%  for jj=1:length(t)
% for i=1:n,
%     pdnn_xiP(jj,i)=min([xi_pp(jj,i);qDpL(jj,i)]);
%     pdnn_xiM(jj,i)=max([xi_pm(jj,i);qDmL(jj,i)]);
% end;
% end   
%     
%  figure;
% plot(t,dqAll(:,4),'c-','linewidth',4);
% hold on;
% title('Simulated dphiL subject to pdnnL1 and dqL1');
% plot(t,pdnn_xiP(:,1),'g--','linewidth',2);
% hold on;
% plot(t,qDpL(:,1),'m-.','linewidth',1);
% hold on;
% plot(t,pdnn_xiM(:,1),'g--','linewidth',2);
% hold on;
% plot(t,qDmL(:,1),'m-.','linewidth',1);
% hold on;
% legend('dphil','pdnnL1','dphiL1');
% 
% 
% %  axis([0 2 -3.5 4]);
% 
% figure;
% plot(t,dqAll(:,5),'k--','linewidth',4);
% hold on;
% title('Simulated dphiR subject to pdnnL2 and dqL2');
% plot(t,pdnn_xiP(:,2),'g--','linewidth',2);
% hold on;
% plot(t,qDpL(:,2),'m-.','linewidth',1);
% hold on;
% plot(t,pdnn_xiM(:,2),'g--','linewidth',2);
% hold on;
% plot(t,qDmL(:,2),'m-.','linewidth',1);
% hold on;
% legend('dphiR','pdnnL2','dphiL2');
% 
% 
% 
% figure;
% plot(t,dqAll(:,6),'k:','linewidth',3);hold on;
% title('Simulated Dtheta1 subject to dthetapdnn1 and dtheta1');
% plot(t,pdnn_xiP(:,3),'g--','linewidth',2);
% hold on;
% plot(t,qDpL(:,3),'m-.','linewidth',1);
% hold on;
% plot(t,pdnn_xiM(:,3),'g--','linewidth',2);
% hold on;
% plot(t,qDmL(:,3),'m-.','linewidth',1);
% hold on;
% legend('dtheta1','dthetapdnn1','dthetaL1');
% 
% % axis([0 2 -1.2 1.2]);
% 
% 
% figure;
% plot(t,dqAll(:,7),'r--','linewidth',3);hold on;
% title('Simulated Dtheta2 subject to dthetapdnn2 and dthetap2');
% plot(t,pdnn_xiP(:,4),'g--','linewidth',2);
% hold on;
% plot(t,qDpL(:,4),'m-.','linewidth',1);
% hold on;
% plot(t,pdnn_xiM(:,4),'g--','linewidth',2);
% hold on;
% plot(t,qDmL(:,4),'m-.','linewidth',1);
% hold on;
% legend('dtheta2','dthetapdnn2','dthetaL2');
% 
% % % axis([0 2 -1.2 1.2]);
% 
% 
% figure;
% plot(t,dqAll(:,8),'b--','linewidth',2);hold on;
% title('Simulated Dtheta3 subject to dthetapdnn3 and dthetap3');
% plot(t,pdnn_xiP(:,5),'g--','linewidth',2);
% hold on;
% plot(t,qDpL(:,5),'m-.','linewidth',1);
% hold on;
% plot(t,pdnn_xiM(:,5),'g--','linewidth',2);
% hold on;
% plot(t,qDmL(:,5),'m-.','linewidth',1);
% hold on;
% legend('dtheta3','dthetapdnn3','dthetaL3');
% 
% % axis([0 2 -1.2 1.2]);
% % 
% 
% figure;
% h=plot(t,dqAll(:,9),'-','linewidth',3);hold on;
% set(h(1,1),'color',[0 0.5 0],'LineWidth',3)
% title('Simulated Dtheta4 subject to dthetapdnn4 and dthetap4');
% plot(t,pdnn_xiP(:,6),'g--','linewidth',2);
% hold on;
% plot(t,qDpL(:,6),'m-.','linewidth',1);
% hold on;
% plot(t,pdnn_xiM(:,6),'g--','linewidth',2);
% hold on;
% plot(t,qDmL(:,6),'m-.','linewidth',1);
% hold on;
% legend('dtheta4','dthetapdnn4','dthetaL4');
% 
% 
% figure;
% plot(t,dqAll(:,10),'k-','linewidth',2);hold on;
% title('Simulated Dtheta5 subject to dthetapdnn5 and dthetap5');
% plot(t,pdnn_xiP(:,7),'g--','linewidth',2);
% hold on;
% plot(t,qDpL(:,7),'m-.','linewidth',1);
% hold on;
% plot(t,pdnn_xiM(:,7),'g--','linewidth',2);
% hold on;
% plot(t,qDmL(:,7),'m-.','linewidth',1);
% hold on;
% legend('dtheta5','dthetapdnn5','dthetaL5');
% 
% 
% figure;
% h=plot(t,dqAll(:,11),'-.','linewidth',3);hold on;
% set(h(1,1),'color',[0 0.6 0],'LineWidth',3)
% title('Simulated Dtheta6 subject to dthetapdnn6 and dthetap6');
% plot(t,pdnn_xiP(:,8),'g--','linewidth',2);
% hold on;
% plot(t,qDpL(:,8),'m-.','linewidth',1);
% hold on;
% plot(t,pdnn_xiM(:,8),'g--','linewidth',2);
% hold on;
% plot(t,qDmL(:,8),'m-.','linewidth',1);
% hold on;
% legend('dtheta6','dthetapdnn6','dthetaL6');
% axis([0 2 -1.2 1.2]);   
    
    
[Ppx,Ppy,Ppz]=position(qAll(1,:));
pos_initial=[Ppx Ppy Ppz]
[Ppx,Ppy,Ppz]=position(qAll(length(t),:));
pos_final=[Ppx Ppy Ppz]
poserror=pos_final-pos_initial

qinitial=qAll(1,:);
qfinal=qAll(length(t),:);
qerror=qinitial-qfinal





