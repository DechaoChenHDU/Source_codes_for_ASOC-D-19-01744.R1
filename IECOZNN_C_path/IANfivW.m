close all
clear all;
format long;
% global n m sBound A bP b dP dM In3m1 T mu qP qM qDp qDm beta q0;
load SYSdata;
load SYSdata1;
load SRDdata1;
load SRDdata2;
load SRDdata3;
[Ppx,Ppy,Ppz]=position(qAll(1,:));
pos_initial=[Ppx Ppy Ppz];
[Ppx,Ppy,Ppz]=position(qAll(length(t),:));
pos_final=[Ppx Ppy Ppz];

jj=1;
for j=1:5:length(t)
    linksX(:,jj)=[carcx(j);j1px(j);j2px(j);j3px(j);j4px(j);j5px(j);j6px(j);j7px(j)];
    linksY(:,jj)=[carcy(j);j1py(j);j2py(j);j3py(j);j4py(j);j5py(j);j6py(j);j7py(j)];
    linksZ(:,jj)=[carcz(j);j1pz(j);j2pz(j);j3pz(j);j4pz(j);j5pz(j);j6pz(j);j7pz(j)];
    carX(:,jj)=[wlfx(j);wlpx(j);wrpx(j);wrfx(j);wlfx(j)];
    carY(:,jj)=[wlfy(j);wlpy(j);wrpy(j);wrfy(j);wlfy(j)];
    carZ(:,jj)=[wlfz(j);wlpz(j);wrpz(j);wrfz(j);wlfz(j)];
    wheelX(:,jj)=[wlpx(j);wrpx(j)];
    wheelY(:,jj)=[wlpy(j);wrpy(j)];
    wheelZ(:,jj)=[wlpz(j);wrpz(j)];
    jj=jj+1;
end
%111111111111111111111111111111111111111111111111111111111111111111111
figure;
% plot3(0,0,0,0.4,-0.4,0);hold on;
%-------------------------links trajectorys of the mm
plot3(linksX,linksY,linksZ,'k-');
%-------------------------joint trajectorys of the mm
% plot3(carcx,carcy,carcz,'LineWidth',2,'color', 'b');hold on;
% plot3(j1px,j1py,j1pz,'LineWidth',2,'LineStyle','-.','color', 'c');hold on;
% plot3(j2px,j2py,j2pz,'LineWidth',2,'LineStyle','--','color', 'k');hold on;
% plot3(j3px,j3py,j3pz,'LineWidth',2,'LineStyle','-.','color', 'm');hold on;
% plot3(j4px,j4py,j4pz,'LineWidth',2,'LineStyle','-.','color', 'c');hold on;
% plot3(j5px,j5py,j5pz,'LineWidth',2,'LineStyle','--','color', 'm');hold on;
% plot3(j6px,j6py,j6pz,'LineWidth',1,'LineStyle','--','color', 'k');hold on;
plot3(carcx,carcy,carcz,'c.','LineWidth',4);hold on;
% plot3(j1px,j1py,j1pz,'b-.','LineWidth',2);hold on;
% plot3(j2px,j2py,j2pz,'k--','LineWidth',2);hold on;
% plot3(j3px,j3py,j3pz,'m.-','LineWidth',2);hold on;
% plot3(j4px,j4py,j4pz,'b--','LineWidth',2);hold on;
% plot3(j5px,j5py,j5pz,'m--','LineWidth',2);hold on;
% plot3(j6px,j6py,j6pz,'k.-','LineWidth',1);hold on;
plot3(j7px,j7py,j7pz,'b--','LineWidth',3);hold on;%end effector
hold on;

%------------------------car
    plot3(wheelX,wheelY,wheelZ,'--ko','MarkerEdgeColor','k',...
          'MarkerFaceColor','y','MarkerSize',6);%车轮
    plot3(carX,carY,carZ,'k-');%车底盘
%-------------------------initial and final stste of mm--------------------
    plot3(pos_initial(1:2,1),pos_initial(1:2,2),pos_initial(1:2,3),...
                  'color', 'r','LineWidth',4);
    plot3(pos_initial(2:8,1),pos_initial(2:8,2),pos_initial(2:8,3),...
                     'color', 'r','LineWidth',3);
    plot3(pos_final(1:2,1),pos_final(1:2,2),pos_final(1:2,3),...
                  'color', 'k','LineWidth',4);
    plot3(pos_final(2:8,1),pos_final(2:8,2),pos_final(2:8,3),...
                     'color', 'k','LineWidth',3);
j=1;
    wheelandcarc=line('xdata',[wlpx(j);carcx(j)],'ydata',[wlpy(j);carcy(j)],'zdata',[wlpz(j);carcz(j)],...
        'color', 'r','LineWidth',3);
    wheelandwheel=line('xdata',[wlpx(j);wrpx(j)],'ydata',[wlpy(j);wrpy(j)],'zdata',[wlpz(j);wrpz(j)],...
        'color', 'r','LineWidth',3);
    wheelandcarc=line('xdata',[wrpx(j);carcx(j)],'ydata',[wrpy(j);carcy(j)],'zdata',[wrpz(j);carcz(j)],...
        'color', 'r','LineWidth',3);
%     jointsc1=line('xdata',[carcx(j);j1px(j)],'ydata',[carcy(j);j1py(j)],'zdata',[carcz(j);j1pz(j)],...
%         'color', 'm','LineWidth',8);
%     joints12=line('xdata',[j1px(j);j2px(j)],'ydata',[j1py(j);j2py(j)],'zdata',[j1pz(j);j2pz(j)],...
%         'color', 'm','LineWidth',4);
%     joints23=line('xdata',[j2px(j);j3px(j)],'ydata',[j2py(j);j3py(j)],'zdata',[j2pz(j);j3pz(j)],...
%         'color', 'm','LineWidth',4);
%     joints34=line('xdata',[j3px(j);j4px(j)],'ydata',[j3py(j);j4py(j)],'zdata',[j3pz(j);j4pz(j)],...
%         'color', 'm','LineWidth',4);
%     joints45=line('xdata',[j4px(j);j5px(j)],'ydata',[j4py(j);j5py(j)],'zdata',[j4pz(j);j5pz(j)],...
%         'color', 'm','LineWidth',4);
%     joints56=line('xdata',[j5px(j);j6px(j)],'ydata',[j5py(j);j6py(j)],'zdata',[j5pz(j);j6pz(j)],...
%         'color', 'm','LineWidth',4);
%     joints67=line('xdata',[j6px(j);j7px(j)],'ydata',[j6py(j);j7py(j)],'zdata',[j6pz(j);j7pz(j)],...
%         'color', 'm','LineWidth',4);
% ------------------------------------final stste of car-------------------
j=length(t);
    wheelandcarc=line('xdata',[wlpx(j);carcx(j)],'ydata',[wlpy(j);carcy(j)],'zdata',[wlpz(j);carcz(j)],...
        'color', 'k','LineWidth',3);
    wheelandwheel=line('xdata',[wlpx(j);wrpx(j)],'ydata',[wlpy(j);wrpy(j)],'zdata',[wlpz(j);wrpz(j)],...
        'color', 'k','LineWidth',3);
    wheelandcarc=line('xdata',[wrpx(j);carcx(j)],'ydata',[wrpy(j);carcy(j)],'zdata',[wrpz(j);carcz(j)],...
        'color', 'k','LineWidth',3);
%     jointsc1=line('xdata',[carcx(j);j1px(j)],'ydata',[carcy(j);j1py(j)],'zdata',[carcz(j);j1pz(j)],...
%         'color', 'k','LineWidth',8);
%     joints12=line('xdata',[j1px(j);j2px(j)],'ydata',[j1py(j);j2py(j)],'zdata',[j1pz(j);j2pz(j)],...
%         'color', 'k','LineWidth',4);
%     joints23=line('xdata',[j2px(j);j3px(j)],'ydata',[j2py(j);j3py(j)],'zdata',[j2pz(j);j3pz(j)],...
%         'color', 'k','LineWidth',4);
%     joints34=line('xdata',[j3px(j);j4px(j)],'ydata',[j3py(j);j4py(j)],'zdata',[j3pz(j);j4pz(j)],...
%         'color', 'k','LineWidth',4);
%     joints45=line('xdata',[j4px(j);j5px(j)],'ydata',[j4py(j);j5py(j)],'zdata',[j4pz(j);j5pz(j)],...
%         'color', 'k','LineWidth',4);
%     joints56=line('xdata',[j5px(j);j6px(j)],'ydata',[j5py(j);j6py(j)],'zdata',[j5pz(j);j6pz(j)],...
%         'color', 'k','LineWidth',4);
%     joints67=line('xdata',[j6px(j);j7px(j)],'ydata',[j6py(j);j7py(j)],'zdata',[j6pz(j);j7pz(j)],...
%         'color', 'k','LineWidth',4);
%     axis equal;
    text(0.25,-0.7,-0.1,'X(m)');
    text(-1.3,0.88,-0.1,'Y(m)');
    text(-0.9,1.72,0.9,'Z(m)');
%22222222222222222222222222222222222222222222222222222222222222222222
figure;
% plot(0,0.95);hold on;
%-------------------------links trajectorys of the mm
plot(linksX,linksY,'k-');hold on;
%-------------------------joint trajectorys of the mm
plot(carcx,carcy,'c.','LineWidth',4);hold on;
% plot(j1px,j1py,'b-.','LineWidth',2);
% plot(j2px,j2py,'k--','LineWidth',2);
% plot(j3px,j3py,'m.-','LineWidth',2);
% plot(j4px,j4py,'b--','LineWidth',2);
% plot(j5px,j5py,'m--','LineWidth',2);
% plot(j6px,j6py,'k.-','LineWidth',1);
plot(j7px,j7py,'b--','LineWidth',3);
% plot(carcx,carcy,'LineWidth',2,'color', 'b');hold on;
% plot(j1px,j1py,'c-.','LineWidth',2);hold on;
% plot(j2px,j2py,'k--','LineWidth',2);hold on;
% plot(j3px,j3py,'m-.','color', 'm','LineWidth',2);hold on;
% plot(j4px,j4py,'-.','LineWidth',2);hold on;
% plot(j5px,j5py,'--','color', 'm','LineWidth',2);hold on;
% plot(j6px,j6py,'--','color', 'k','LineWidth',1);hold on;
% plot(j7px,j7py,'--','color', 'b','LineWidth',3);hold on;%end effector
hold on;
%------------------------car
    plot(wheelX,wheelY,'--ko','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',6);%车轮
    plot(carX,carY,'k-');%车底盘
%-----------------------------initial and final stste of mm--------------------------
    plot3(pos_initial(1:2,1),pos_initial(1:2,2),pos_initial(1:2,3),...
                  'color', 'r','LineWidth',4);
    plot3(pos_initial(2:8,1),pos_initial(2:8,2),pos_initial(2:8,3),...
                     'color', 'r','LineWidth',3);
    plot3(pos_final(1:2,1),pos_final(1:2,2),pos_final(1:2,3),...
                  'color', 'k','LineWidth',4);
    plot3(pos_final(2:8,1),pos_final(2:8,2),pos_final(2:8,3),...
                     'color', 'k','LineWidth',3);
j=1;
    wheelandcarc=line('xdata',[wlpx(j);carcx(j)],'ydata',[wlpy(j);carcy(j)],...
        'color', 'r','LineWidth',3);
    wheelandwheel=line('xdata',[wlpx(j);wrpx(j)],'ydata',[wlpy(j);wrpy(j)],...
        'color', 'r','LineWidth',3);
    wheelandcarc=line('xdata',[wrpx(j);carcx(j)],'ydata',[wrpy(j);carcy(j)],...
        'color', 'r','LineWidth',3);
%     jointsc1=line('xdata',[carcx(j);j1px(j)],'ydata',[carcy(j);j1py(j)],...
%         'color', 'm','LineWidth',8);
%     joints12=line('xdata',[j1px(j);j2px(j)],'ydata',[j1py(j);j2py(j)],...
%         'color', 'm','LineWidth',4);
%     joints23=line('xdata',[j2px(j);j3px(j)],'ydata',[j2py(j);j3py(j)],...
%         'color', 'm','LineWidth',4);
%     joints34=line('xdata',[j3px(j);j4px(j)],'ydata',[j3py(j);j4py(j)],...
%         'color', 'm','LineWidth',4);
%     joints45=line('xdata',[j4px(j);j5px(j)],'ydata',[j4py(j);j5py(j)],...
%         'color', 'm','LineWidth',4);
%     joints56=line('xdata',[j5px(j);j6px(j)],'ydata',[j5py(j);j6py(j)],...
%         'color', 'm','LineWidth',4);
%     joints67=line('xdata',[j6px(j);j7px(j)],'ydata',[j6py(j);j7py(j)],...
%         'color', 'm','LineWidth',4);
% ------------------------------------final stste of car-------------------
j=length(t);
    wheelandcarc=line('xdata',[wlpx(j);carcx(j)],'ydata',[wlpy(j);carcy(j)],...
        'color', 'k','LineWidth',3);
    wheelandwheel=line('xdata',[wlpx(j);wrpx(j)],'ydata',[wlpy(j);wrpy(j)],...
        'color', 'k','LineWidth',3);
    wheelandcarc=line('xdata',[wrpx(j);carcx(j)],'ydata',[wrpy(j);carcy(j)],...
        'color', 'k','LineWidth',3);
%     jointsc1=line('xdata',[carcx(j);j1px(j)],'ydata',[carcy(j);j1py(j)],...
%         'color', 'k','LineWidth',8);
%     joints12=line('xdata',[j1px(j);j2px(j)],'ydata',[j1py(j);j2py(j)],...
%         'color', 'k','LineWidth',4);
%     joints23=line('xdata',[j2px(j);j3px(j)],'ydata',[j2py(j);j3py(j)],...
%         'color', 'k','LineWidth',4);
%     joints34=line('xdata',[j3px(j);j4px(j)],'ydata',[j3py(j);j4py(j)],...
%         'color', 'k','LineWidth',4);
%     joints45=line('xdata',[j4px(j);j5px(j)],'ydata',[j4py(j);j5py(j)],...
%         'color', 'k','LineWidth',4);
%     joints56=line('xdata',[j5px(j);j6px(j)],'ydata',[j5py(j);j6py(j)],...
%         'color', 'k','LineWidth',4);
%     joints67=line('xdata',[j6px(j);j7px(j)],'ydata',[j6py(j);j7py(j)],...
%         'color', 'k','LineWidth',4);
%     axis equal;
%     text(1.25,-0.265,'X(m)');
%     text(-1.15,1.68,'Y(m)');
%     box off;
    
%333333333333333333333333333333333333333333333333333333333333333333333
figure;
% plot(0,0.95);
hold on;
%-------------------------car trajectorys of the mm
% plot(carcx,carcy,'r-.','LineWidth',4);hold on;
% plot(j7px,j7py,'b-.','LineWidth',3);
%------------------------car
    plot(wheelX,wheelY,'-ko','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',6);%车轮
    plot(wlpx,wlpy,'-.',wrpx,wrpy,'-.','linewidth',2);%车轮轨迹
    plot(carX,carY,'k-');%车底盘
%-----------------------------initial and final stste of car
j=1;
    wheelandcarc=line('xdata',[wlpx(j);carcx(j)],'ydata',[wlpy(j);carcy(j)],...
        'color', 'r','LineWidth',3);
    wheelandwheel=line('xdata',[wlpx(j);wrpx(j)],'ydata',[wlpy(j);wrpy(j)],...
        'color', 'r','LineWidth',3);
    wheelandcarc=line('xdata',[wrpx(j);carcx(j)],'ydata',[wrpy(j);carcy(j)],...
        'color', 'r','LineWidth',3);
% ------------------------------------final stste of car-------------------
j=length(t);
    wheelandcarc=line('xdata',[wlpx(j);carcx(j)],'ydata',[wlpy(j);carcy(j)],...
        'color', 'k','LineWidth',3);
    wheelandwheel=line('xdata',[wlpx(j);wrpx(j)],'ydata',[wlpy(j);wrpy(j)],...
        'color', 'k','LineWidth',3);
    wheelandcarc=line('xdata',[wrpx(j);carcx(j)],'ydata',[wrpy(j);carcy(j)],...
        'color', 'k','LineWidth',3);
%     axis equal;
    text(1.24,-0.075,'X(m)');
    text(-1,1.69,'Y(m)');
%     box off;
    
%4444444444444444444444444444444444444444444444444444444444444444444444
figure;
% plot(0,0.95);
%-------------------------car trajectorys of the mm
plot3(carcx,carcy,carcz,'c.','LineWidth',4);hold on;
plot3(j7px,j7py,j7pz,'b--','LineWidth',3);
%-------------------------links trajectorys of the mm
plot3(linksX,linksY,linksZ,'k-');hold on;
%-----------------------------initial and final stste of mm--------------------------
    plot3(pos_initial(1:2,1),pos_initial(1:2,2),pos_initial(1:2,3),...
                  'color', 'r','LineWidth',4);
    plot3(pos_initial(2:8,1),pos_initial(2:8,2),pos_initial(2:8,3),...
                     'color', 'r','LineWidth',4);
    plot3(pos_final(1:2,1),pos_final(1:2,2),pos_final(1:2,3),...
                  'color', 'k','LineWidth',4);
    plot3(pos_final(2:8,1),pos_final(2:8,2),pos_final(2:8,3),...
                     'color', 'k','LineWidth',3);
%     axis equal;
    text(0.25,-0.7,-0.1,'X(m)');
    text(-1.3,0.88,-0.1,'Y(m)');
    text(-0.9,1.72,0.9,'Z(m)');
%     box off;
    
%555555555555555555555555555555555555555555555555555555555555555555555
figure;
% plot3(0,0,0,0.4,-0.4,0);
% hold on;
%-------------------------links trajectorys of the mm
% plot3(linksX,linksY,linksZ,'k-');
%-------------------------joint trajectorys of the mm
% plot3(carcx,carcy,carcz,'LineWidth',2,'color', 'b');hold on;
% plot3(j1px,j1py,j1pz,'LineWidth',2,'LineStyle','-.','color', 'c');hold on;
% plot3(j2px,j2py,j2pz,'LineWidth',2,'LineStyle','--','color', 'k');hold on;
% plot3(j3px,j3py,j3pz,'LineWidth',2,'LineStyle','-.','color', 'm');hold on;
% plot3(j4px,j4py,j4pz,'LineWidth',2,'LineStyle','-.','color', 'c');hold on;
% plot3(j5px,j5py,j5pz,'LineWidth',2,'LineStyle','--','color', 'm');hold on;
% plot3(j6px,j6py,j6pz,'LineWidth',1,'LineStyle','--','color', 'k');hold on;
% plot3(carcx,carcy,carcz,'r-.','LineWidth',4);hold on;
hk=plot3(j1px,j1py,j1pz,'-x',j2px,j2py,j2pz,'--',j3px,j3py,j3pz,'-.',...
         j4px,j4py,j4pz,'--',j5px,j5py,j5pz,'--',j6px,j6py,j6pz,'-x');
set(hk(1,:),'color',[0 0.5 0],'LineWidth',1);
set(hk(2,:),'color',[0 0.2 0.4],'LineWidth',3);
set(hk(3,:),'color',[0.9 0.2 0.4],'LineWidth',3);
set(hk(4,:),'color',[0.5 0.5 0],'LineWidth',2);
set(hk(5,:),'color','r','LineWidth',1);
set(hk(6,:),'color','k','LineWidth',1);
plot3(j7px,j7py,j7pz,'b-.','LineWidth',3);hold on;%end effector
hold on;

% %------------------------car
%     plot3(wheelX,wheelY,wheelZ,'--ko','MarkerEdgeColor','k',...
%           'MarkerFaceColor','y','MarkerSize',6);%车轮
%     plot3(carX,carY,carZ,'k-');%车底盘
%-------------------------initial and final stste of mm--------------------
    plot3(pos_initial(1:2,1),pos_initial(1:2,2),pos_initial(1:2,3),...
                  'color', 'r','LineWidth',4);
    plot3(pos_initial(2:8,1),pos_initial(2:8,2),pos_initial(2:8,3),...
                     'color', 'r','LineWidth',3);
    plot3(pos_final(1:2,1),pos_final(1:2,2),pos_final(1:2,3),...
                  'color', 'k','LineWidth',4);
    plot3(pos_final(2:8,1),pos_final(2:8,2),pos_final(2:8,3),...
                     'color', 'k','LineWidth',3);
j=1;
    wheelandcarc=line('xdata',[wlpx(j);carcx(j)],'ydata',[wlpy(j);carcy(j)],'zdata',[wlpz(j);carcz(j)],...
        'color', 'r','LineWidth',3);
    wheelandwheel=line('xdata',[wlpx(j);wrpx(j)],'ydata',[wlpy(j);wrpy(j)],'zdata',[wlpz(j);wrpz(j)],...
        'color', 'r','LineWidth',3);
    wheelandcarc=line('xdata',[wrpx(j);carcx(j)],'ydata',[wrpy(j);carcy(j)],'zdata',[wrpz(j);carcz(j)],...
        'color', 'r','LineWidth',3);
% ------------------------------------final stste of car-------------------
j=length(t);
    wheelandcarc=line('xdata',[wlpx(j);carcx(j)],'ydata',[wlpy(j);carcy(j)],'zdata',[wlpz(j);carcz(j)],...
        'color', 'k','LineWidth',3);
    wheelandwheel=line('xdata',[wlpx(j);wrpx(j)],'ydata',[wlpy(j);wrpy(j)],'zdata',[wlpz(j);wrpz(j)],...
        'color', 'k','LineWidth',3);
    wheelandcarc=line('xdata',[wrpx(j);carcx(j)],'ydata',[wrpy(j);carcy(j)],'zdata',[wrpz(j);carcz(j)],...
        'color', 'k','LineWidth',3);
%     axis equal;
    text(0.25,-0.7,-0.1,'X(m)');
    text(-1.3,0.88,-0.1,'Y(m)');
    text(-0.9,1.72,0.9,'Z(m)');
%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


% % %4444444444444444444444444444444444444444444444444444444444444444444
figure;
%       plot3(0,0,0,0.4,-0.4,0);
% hold on;
       %-------------------------car trajectory
      plot3(carcx,carcy,carcz,'LineWidth',2,'color', 'cyan');
hold on;
%-------------------------links trajectorys of the mm
  for j=1:10:length(t),
      jointsc1=line('xdata',[carcx(j);j1px(j)],'ydata',[carcy(j);j1py(j)],'zdata',[carcz(j);j1pz(j)],...
        'color', 'm', 'LineStyle','-');
      joints12=line('xdata',[j1px(j);j2px(j)],'ydata',[j1py(j);j2py(j)],'zdata',[j1pz(j);j2pz(j)],...
        'color', 'b','LineStyle','-');
      joints23=line('xdata',[j2px(j);j3px(j)],'ydata',[j2py(j);j3py(j)],'zdata',[j2pz(j);j3pz(j)],...
        'color', 'm','LineStyle','-');
      joints34=line('xdata',[j3px(j);j4px(j)],'ydata',[j3py(j);j4py(j)],'zdata',[j3pz(j);j4pz(j)],...
        'color', 'b','LineStyle','-');
      joints45=line('xdata',[j4px(j);j5px(j)],'ydata',[j4py(j);j5py(j)],'zdata',[j4pz(j);j5pz(j)],...
        'color', 'm','LineStyle','-');
      joints56=line('xdata',[j5px(j);j6px(j)],'ydata',[j5py(j);j6py(j)],'zdata',[j5pz(j);j6pz(j)],...
        'color', 'b','LineStyle','-');
      joints67=line('xdata',[j6px(j);j7px(j)],'ydata',[j6py(j);j7py(j)],'zdata',[j6pz(j);j7pz(j)],...
        'color', 'm','LineStyle','-');
      drawnow
  end
      plot3(j7px,j7py,j7pz,'LineWidth',2,'color', 'b');hold on;

%       %%%%%变清楚
%   for j=1:5:length(t),
% wheelX1(j)=wheelX(j);
% wheelY1(j)=wheelY(j);
% wheelZ1(j)=wheelZ(j);
% carX1(j)=carX(j);
% carY1(j)=carY(j);
% carZ1(j)=carZ(j);
%   end
      
      
%------------------------car
    plot3(wheelX,wheelY,wheelZ,'ko','LineWidth',3,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',6);%车轮
    plot3(carX,carY,carZ,'k-');%车底盘
    %-------------------------------------------initial stste of mm
    j=1;
    wheelandcarc=line('xdata',[wlpx(j);carcx(j)],'ydata',[wlpy(j);carcy(j)],'zdata',[wlpz(j);carcz(j)],...
        'color', 'm','erasemode','none');
    wheelandwheel=line('xdata',[wlpx(j);wrpx(j)],'ydata',[wlpy(j);wrpy(j)],'zdata',[wlpz(j);wrpz(j)],...
        'color', 'm','erasemode','none');
    wheelandcarc=line('xdata',[wrpx(j);carcx(j)],'ydata',[wrpy(j);carcy(j)],'zdata',[wrpz(j);carcz(j)],...
        'color', 'm','erasemode','none');
    plot3(linksX(:,1),linksY(:,1),linksZ(:,1),'r.-','LineWidth',3);
    %----------------------------------------------------
    carforanimate=[carcx,wlpx,wrpx,carcx,...
                   carcy,wlpy,wrpy,carcy,...
                   carcz,wlpz,wrpz,carcz];
    %----------------------------------------------------
    drawnow
    animate(qAll,carforanimate);%--------end state
    drawnow
    text(1,-3,0.3,'X(m)');
    text(-1.7,-2,0.3,'Y(m)');
    text(-1.7,1.8,0.3,'Z(m)');