clear
clc
A1=load('forward_d1.txt');
A2=load('forward_d2.txt');
A3=load('forward_p.txt');
A4=load('forward_sigma.txt');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1)
plot(A1(:,1),A1(:,2),'bo','linewidth',2);
hold on
% xlim([-0.01,5.01])
% ylim([-0.6,1])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('d_u','Fontname', 'Times New Roman','FontSize',20);
ylabel('A','Fontname', 'Times New Roman','FontSize',20);
subplot(2,2,2)
plot(A2(:,1),A2(:,2),'bo','linewidth',2);
hold on
% xlim([-0.01,5.01])
% ylim([-0.6,1])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('d_v','Fontname', 'Times New Roman','FontSize',20);
ylabel('A','Fontname', 'Times New Roman','FontSize',20);
subplot(2,2,3)
plot(A3(:,1),A3(:,2),'bo','linewidth',2);
hold on
% xlim([-0.01,5.01])
% ylim([-0.6,1])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('p','Fontname', 'Times New Roman','FontSize',20);
ylabel('A','Fontname', 'Times New Roman','FontSize',20);
subplot(2,2,4)
plot(A4(:,1),A4(:,2),'bo','linewidth',2);
hold on
% xlim([-0.01,5.01])
% ylim([-0.6,1])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('\sigma','Fontname', 'Times New Roman','FontSize',20);
ylabel('A','Fontname', 'Times New Roman','FontSize',20);