clear;
format long;
load SYSdata;
load SYSdata1;
load INITdata;

jj=0;
epsilon=0;
% interval=0.0125;  %primal
interval=0.0415;
   %这里的抽样是因为ode解出来的时间间隔较杂乱，如t=0, 0.1, 0.25, 0.3, 0.31...,
   %这里抽样后可以使得时间在数值上（较为）均匀增加，（当然损失一些精度）；而
   %第五个文件是在此基础上在时间t的编号如t（jj）上再次采样，使得曲线不那么密，时间在数值
   %上仍然均匀增加
   
   sndsizey=size(y)
for ii=1:length(t)   %抽样,暂存在tn，最后再把tn给t以刷新。目的是使得最后连杆图轨
                      %迹较均匀，但是也会影响误差等的表现，因为可能有些大误
                       %差点由于抽样漏掉，所以不可太大或太小。   
    if(t(ii,1)>=epsilon) %因为先前的t不一定是按照interval=0.0125的，所以用>=
        jj=jj+1;
        tn(jj,1)=t(ii,1);
        yn(jj,:)=y(ii,:);
        epsilon=tn(jj,1)+interval;  %抽样间隔
    elseif(ii==length(t))
        jj=jj+1;
        tn(jj,1)=t(ii,1);
        yn(jj,:)=y(ii,:);
    end
end
% figure 
% plot(t,'.');hold on
% plot(tn,'x');
clear t y;
t=tn;
y=yn;
% figure('Name',strcat('yn-tn'))
% plot(t,y(:,3),t,y(:,4),t,y(:,5),t,y(:,6),t,y(:,7),t,y(:,8),...
%     t,y(:,9),t,y(:,10),t,y(:,11));
% figure('Name',strcat('t-xcycphi'));
% % legend(y(1),y(2),y(3),y(4),y(5),y(6),y(7),y(8),y(9))
% plot(t,y(:,1),t,y(:,2),t,y(:,3));
% 
% figure('Name',strcat('t-wheel'));
% plot(t,y(:,4),'--',t,y(:,5),'-','LineWidth',2);
% legend('phiL','phiR')
% text(9.7,-6,'t(s)')
% text(0.5,65,'rad')
% box off;
% 
% figure('Name',strcat('t-theta'));
% plot(t,y(:,6),'k:',...
%       t,y(:,7),'r--',...
%       'LineWidth',3);hold on;
%  h=plot(t,y(:,8),'b--',...
%       t,y(:,9),'m-',...
%       t,y(:,10),'k-',...
%       t,y(:,11),'-.',...
%       'LineWidth',2);
%   set(h(4,1),'color',[0 0.5 0],'LineWidth',3)
%   set(h(2,1),'color',[0 0.6 0],'LineWidth',3)
% legend('q1','q2','q3','q4','q5','q6')
% text(9.7,-2.75,'t(s)')
% text(0.5,2.6,'rad')
% box off;
% size(t)
% size(y)
% clear tn yn;

% qAll=y(:,1:n);
% qAll=y(:,1:(n+3));
qAll=y(:,1:11);

%qAll=y(:,:);

% SqAll=size(qAll)
%--------caculate the velosity for error----------20100926add-by-lijun
for li=1:length(t),
    doty(li,:)=IANnetW(t(li),y(li,:));
end

dqAll=doty(:,1:11);

%dqAll=y(:,12:12+8);
% sizesnddqAll=size(dqAll)
%-----------------------------------------------------------
% dqAll=y(:,(n+1):(2*n));%new, need change
% size(dqAll)
% uAll=y(:,(n+1):(n+3*n+m+1));
% size(uAll)
% dqAll=uAll(:,1:n);
% size(dqAll)

% save SNDdata t qAll uAll dqAll;
save SNDdata t y qAll dqAll;
% save INITdata t y;


