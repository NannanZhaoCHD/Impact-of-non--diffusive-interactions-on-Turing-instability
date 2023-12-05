clear  %%%%%%%%%%%% based the data produced by Fortran file, to plot Figure 5 (or 11)
clc
A1=load('p09.txt');
% D=A1(1:30000,:);
N=100;
C = linspecer(N);
hold off;
for ii=1:N
    plot(1:100000,A1(:,ii),'color',C(ii,:),'linewidth',3);
    hold on
end

% semilogx(t1,x1,'r','linewidth',2)
% hold on
% semilogx(t1,x2,'b','linewidth',2)
% hold on
% semilogx(t1,x3,'y','linewidth',2)
% hold on
% semilogx(t1,x4,'g','linewidth',2)
% hold on

xlim([0,100000])
% ylim([-1,1])
% set(gcf,'Position',[200 200 400 360]);
set(gca,'linewidth',2,'fontsize',18,'fontname','Times');
xlabel('time','Fontname', 'Times New Roman','FontSize',20);
ylabel('x_i(t)','Fontname', 'Times New Roman','FontSize',20);
