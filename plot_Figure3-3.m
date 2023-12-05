clear
clc
A1=load('p01.txt');
A2=load('p05.txt');
A3=load('p09.txt');
%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,1)
for i=1:100
    plot([i,i],[0,A1(end,i)],'k:','linewidth',2);
    hold on
end
plot(1:100,A1(end,:),'bo','markersize',6,'MarkerFaceColor','b');
hold on
plot(xlim,[0,0],'k--','linewidth',1);
hold on
xlim([-1,101])
ylim([-2,2])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('i','Fontname', 'Times New Roman','FontSize',20);
ylabel('u_i','Fontname', 'Times New Roman','FontSize',20);
%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,2)
for i=1:100
    plot([i,i],[0,A2(end,i)],'k:','linewidth',2);
    hold on
end
plot(1:100,A2(end,:),'bo','markersize',6,'MarkerFaceColor','b');
hold on
plot(xlim,[0,0],'k--','linewidth',1);
hold on
xlim([-1,101])
ylim([-2,2])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('i','Fontname', 'Times New Roman','FontSize',20);
ylabel('u_i','Fontname', 'Times New Roman','FontSize',20);
%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,3)
for i=1:100
    plot([i,i],[0,A3(end,i)],'k:','linewidth',2);
    hold on
end
plot(1:100,A3(end,:),'bo','markersize',6,'MarkerFaceColor','b');
hold on
plot(xlim,[0,0],'k--','linewidth',1);
hold on
xlim([-1,101])
ylim([-2,2])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('i','Fontname', 'Times New Roman','FontSize',20);
ylabel('u_i','Fontname', 'Times New Roman','FontSize',20);
