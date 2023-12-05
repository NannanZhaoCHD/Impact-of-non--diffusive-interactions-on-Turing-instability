clear
clc
% A=load('p_duichen.txt');
A=load('p_feiduichen.txt');
plot(A(:,1),A(:,2),'c','linewidth',2)
hold on
plot(xlim,[0,0],'r--','linewidth',2)
hold on
% xlim([-2.2,1.2])
% ylim([-1.2,1.2])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
ylabel('LLE','Fontname', 'Times New Roman','FontSize',20);
xlabel('p','Fontname', 'Times New Roman','FontSize',20);