clear
clc
A1=load('p01.txt');
A2=load('p05.txt');
A3=load('p09.txt');
subplot(3,1,1)
LR=[1:100];
LI=[1:100000];
imagesc(LR,LI,A1)
set(gca,'YDir','normal')
colormap hot
colorbar
hold on
% xlim([0,100000])
% ylim([-1,1])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
ylabel('time','Fontname', 'Times New Roman','FontSize',20);
xlabel('x_i','Fontname', 'Times New Roman','FontSize',20);
%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,2)
LR=[1:100];
LI=[1:100000];
imagesc(LR,LI,A2)
set(gca,'YDir','normal')
colormap hot
colorbar
hold on
% xlim([0,100000])
% ylim([-1,1])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
ylabel('time','Fontname', 'Times New Roman','FontSize',20);
xlabel('x_i','Fontname', 'Times New Roman','FontSize',20);
%%%%%%%%%%%%%%%%
subplot(3,1,3)
LR=[1:100];
LI=[1:100000];
imagesc(LR,LI,A3)
set(gca,'YDir','normal')
colormap hot
colorbar
hold on
% xlim([0,100000])
% ylim([-1,1])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
ylabel('time','Fontname', 'Times New Roman','FontSize',20);
xlabel('x_i','Fontname', 'Times New Roman','FontSize',20);



